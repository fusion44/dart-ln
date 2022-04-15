import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../../errors.dart';
import '../../../funding_source.dart';
import '../../../models.dart';
import '../common/cln_models.dart';
import '../common/cln_utils.dart';

class LnCoreConnectionData extends ConnectionData {
  final String address;

  LnCoreConnectionData([
    this.address = '/home/fusion44/.lightning/testnet/lightning-rpc',
  ]);
}

class LnCoreRPCSource implements FundingSource {
  final int _invoiceStreamId = 0;
  final int _paymentsStreamId = 1;
  int _currentId = 100;
  late final Socket _socket;
  late final StreamSubscription<dynamic> _sub;
  late final Map<int, Completer<dynamic>> _completers = {};
  late final Stream<List> _eventStream;
  final StreamController<dynamic> _invoicePaidController =
      StreamController<dynamic>();
  late final Stream<dynamic> _invoicesPaidStream =
      _invoicePaidController.stream.asBroadcastStream();
  final StreamController<dynamic> _paymentController =
      StreamController<dynamic>();
  late final Stream<dynamic> _paymentStream =
      _paymentController.stream.asBroadcastStream();

  bool _initialized = false;

  @override
  FutureOr<void> connect(ConnectionData data) async {
    if (data is! LnCoreConnectionData) {
      throw ArgumentError('Data must be of class CLnConnectionData.');
    }

    final addr = InternetAddress(data.address, type: InternetAddressType.unix);
    try {
      _socket = await Socket.connect(addr, 0);
    } catch (e) {
      throw ConnectionError(
        'Failed to connect to CLightning RPC server at ${data.address}',
        osError: e.toString(),
      );
    }
    _eventStream = _socket.map((event) {
      try {
        final ut8 = utf8.decode(event);
        final spl = ut8.split('\n');
        final decoded =
            spl.where((e) => e.isNotEmpty).map((e) => json.decode(e)).toList();

        return decoded;
      } catch (e) {
        print(e);
        return const [];
      }
    }).asBroadcastStream();

    _sub = _eventStream.listen(
      (events) {
        for (final e in events) {
          if (e is! Map<String, dynamic>) return;
          if (!e.containsKey('id')) return;
          if (e.containsKey('error')) {
            throw StateError('Error: ${e['error']}');
          }
          if (!e.containsKey('result')) return;
          final id = e['id'];

          if (id == 0) {
            _invoicePaidController.add(e['result']);
          } else if (id >= 100 && _completers.containsKey(id)) {
            final completer = _completers[id];
            if (completer != null) {
              completer.complete(e);
              _completers.remove(id);
            }
          } else {
            throw StateError('Unhandled event: $e');
          }
        }
      },
      onDone: () => print('End JSON RPC Stream'),
      onError: (error) => print('Error in JSON RPC Stream: $error'),
    );

    _prepareInvoicePaidStream();
    _initialized = true;
  }

  @override
  FutureOr<void> dispose() async {
    await _invoicePaidController.close();
    await _sub.cancel();
    await _socket.close();
  }

  @override
  FutureOr<InvoiceData> createInvoice({
    required int mSat,
    String memo = '',
    String? internalId,
    DateTime? expiry,
  }) async {
    if (!_initialized) throw StateError('Not initialized.');

    internalId ??= DateTime.now().microsecondsSinceEpoch.toString();
    final params = [mSat, internalId, memo, expiry?.microsecondsSinceEpoch];
    final map = _buildRequestData('invoice', params);

    final res = await _sendRequest(map);
    if (res is Map<String, dynamic> && res.containsKey('error')) {
      throw SourceError(res['error']?.message);
    }

    final dat = CLNInvoiceData.fromJson(res['result']);
    if (!dat.valid()) {
      throw StateError('C-Lightning delivered a invalid invoice');
    }

    return InvoiceData(
      id: internalId,
      bolt11: dat.bolt11!,
      expiry: DateTime.fromMillisecondsSinceEpoch(dat.expiresAt! * 1000),
      preimage: dat.paymentSecret!,
    );
  }

  @override
  FutureOr<InvoiceStatus> invoiceStatus(String id) async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('listinvoices', [id]);
    final res = await _sendRequest(map);
    final list = CLNInvoiceList.fromJson(res['result']);

    if (list.invoices.isEmpty) {
      return InvoiceStatus(id, false, false, 0);
    }

    if (list.invoices.length == 1) {
      final amount = parseMsat(list.invoices[0].amountMsat);
      final status = list.invoices[0].status == 'paid' ? true : false;

      return InvoiceStatus(id, true, status, amount);
    }

    throw StateError('Multiple entries found for ID: $id');
  }

  @override
  FutureOr<Stream<dynamic>> invoicesPaidStream() async {
    if (!_initialized) throw StateError('Not initialized.');

    return _invoicesPaidStream;
  }

  @override
  FutureOr<List<InvoiceStatus>> listInvoices() async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('listinvoices', const []);
    final res = await _sendRequest(map);
    if (res is Map<String, dynamic> && res.containsKey('error')) {
      throw SourceError(res['error']?.message);
    }

    final invoices = <InvoiceStatus>[];
    if (res is Map<String, dynamic> && res.containsKey('result')) {
      if (res['result'] is Map<String, dynamic> &&
          res['result'].containsKey('invoices')) {
        for (final i in res['result']['invoices']) {
          final ii = CLNInvoice.fromJson(i);
          invoices.add(
            InvoiceStatus(
              ii.label,
              true,
              ii.status == 'paid',
              parseMsat(ii.amountMsat),
            ),
          );
        }
        return invoices;
      }
    }

    return [];
  }

  @override
  FutureOr<DecodedInvoice> decodeInvoice(String bolt11) async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('decode', [bolt11]);
    final res = await _sendRequest(map);
    if (res is Map<String, dynamic> && res.containsKey('error')) {
      throw SourceError(res['error']?.message);
    }

    return getDecodedInvoiceFromJson(res['result']);
  }

  @override
  FutureOr<PaymentStatusResult> paymentStatus({
    String? bolt11,
    String? paymentHash,
  }) async {
    if (!_initialized) throw StateError('Not initialized.');
    if (bolt11 == null && paymentHash == null) {
      throw ArgumentError('bolt11 and paymentHash cannot be both null');
    }
    if (bolt11 != null && paymentHash != null) {
      throw StateError('Only one of bolt11 or paymentHash can be set.');
    }

    final map = _buildRequestData('listpays', {
      if (bolt11 != null) 'bolt11': bolt11,
      if (paymentHash != null) 'payment_hash': paymentHash,
    });
    final res = await _sendRequest(map);

    if (res is Map<String, dynamic> && res.containsKey('error')) {
      throw SourceError(res['error']?.message);
    }

    if (res is Map<String, dynamic> &&
        res.containsKey('result') &&
        res['result'].containsKey('pays')) {
      final l = res['result']['pays'];

      if (l is! List<dynamic>) {
        throw StateError('Invalid response from C-Lightning');
      }

      if (l.isEmpty) {
        return PaymentStatusResult(false);
      }

      if (l.length == 1) {
        final p = getPaymentFromJson(l[0]);
        return PaymentStatusResult(true, payment: p);
      }

      return PaymentStatusResult(
        false,
        error: 'Multiple entries found for: ${bolt11 ?? paymentHash}',
      );
    }

    throw StateError('Unknown error');
  }

  @override
  FutureOr<Stream<dynamic>> paymentsStream() async {
    if (!_initialized) throw StateError('Not initialized.');

    return _paymentStream;
  }

  @override
  FutureOr<Payment> sendPayment(String invoice, {int? amount}) async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('pay', {
      'bolt11': invoice,
      if (amount != null) 'msatoshi': amount,
    });

    final res = await _sendRequest(map);
    if (res is Map<String, dynamic> && res.containsKey('error')) {
      throw SourceError(res['error']?.message);
    }

    final p = getPaymentFromJson(res['result']);
    return p;
  }

  @override
  WalletType type() => WalletType.ln_core;

  @override
  FutureOr<WalletBalance> walletBalance() async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('listfunds', const []);
    final res = await _sendRequest(map);
    return getWalletBalance(res);
  }

  Map<String, Object> _buildRequestData(String method, dynamic params) => {
        'jsonrpc': '2.0',
        'method': method,
        'params': params,
      };

  Future<dynamic> _sendRequest(Map<String, Object> params) {
    _currentId += 1;
    final id = _currentId;
    params['id'] = id;

    _socket.add(utf8.encode(jsonEncode(params)));
    final completer = Completer<dynamic>();
    _completers[id] = completer;

    return completer.future;
  }

  void _prepareInvoicePaidStream() async {
    final res = await _sendRequest(_buildRequestData('listinvoices', const []));
    final list = CLNInvoiceList.fromJson(res['result']);
    int lastPayIndex = 0;
    for (var i in list.invoices.reversed) {
      if (i.payIndex == null) continue;
      if (i.payIndex! > lastPayIndex) {
        lastPayIndex = i.payIndex!;
      }
    }

    final map = _buildRequestData(
      'waitanyinvoice',
      {"lastpay_index": lastPayIndex},
    );
    map['id'] = _invoiceStreamId;
    _socket.add(utf8.encode(jsonEncode(map)));
  }
}
