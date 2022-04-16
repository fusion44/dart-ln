import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../../../funding_source.dart';
import '../../../models.dart';
import '../../../sse_client/sse_client.dart';
import '../common/cln_models.dart';
import '../common/cln_utils.dart';

class SparkoConnectionData extends ConnectionData {
  final String address;
  final String accessKey;

  SparkoConnectionData([
    this.address = 'http://localhost:9737',
    this.accessKey = 'masterkeythatcandoeverything',
  ]);
}

class SparkoSource implements FundingSource {
  late final StreamSubscription<dynamic> _sub;
  final StreamController<dynamic> _invoicePaidController =
      StreamController<dynamic>();
  late final Stream<dynamic> _invoicesPaidStream =
      _invoicePaidController.stream.asBroadcastStream();
  final StreamController<dynamic> _paymentController =
      StreamController<dynamic>();
  late final Stream<dynamic> _paymentStream =
      _paymentController.stream.asBroadcastStream();

  bool _initialized = false;

  late final SparkoConnectionData _connectionData;

  late final Stream<SSEModel> _stream;

  @override
  FutureOr<void> connect(ConnectionData data) async {
    if (data is! SparkoConnectionData) {
      throw ArgumentError('Data must be of class SparkoConnectionData.');
    }

    _connectionData = data;

    final url = '${_connectionData.address}/stream';
    try {
      _stream = await SSEClient.subscribeToSSE(url, _connectionData.accessKey);
    } catch (e) {
      print('Unable to connect to the SEE endpoint. $e');
    }

    _sub = _stream.listen((event) {
      switch (event.event) {
        case 'invoice_payment':
          _invoicePaidController.add(event);
          break;
        case 'sendpay_success':
          _paymentController.add(event);
          break;
        default:
          // print('Unknown event: ${event.event}');
          break;
      }
    });
    _initialized = true;
  }

  @override
  FutureOr<void> dispose() async {
    await _paymentController.close();
    await _invoicePaidController.close();
    await _sub.cancel();
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

    final dat = CLNInvoiceData.fromJson(res);
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
    final list = CLNInvoiceList.fromJson(res);
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
    if (res is Map<String, dynamic> && res.containsKey('invoices')) {
      for (final i in res['invoices']) {
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

    return getDecodedInvoiceFromJson(res);
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

    if (res is Map<String, dynamic> && res.containsKey('pays')) {
      final l = res['pays'];

      if (l is! List<dynamic>) {
        throw StateError('Invalid response from Sparko');
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

    final p = getPaymentFromJson(res);
    return p;
  }

  @override
  WalletType type() => WalletType.sparko;

  @override
  FutureOr<WalletBalance> walletBalance() async {
    if (!_initialized) throw StateError('Not initialized.');

    final map = _buildRequestData('listfunds', const []);
    final res = await _sendRequest(map);
    return getWalletBalance({'result': res});
  }

  Map<String, Object> _buildRequestData(String method, dynamic params) => {
        'jsonrpc': '2.0',
        'method': method,
        'params': params,
      };

  Future<dynamic> _sendRequest(Map<String, Object> params) async {
    final headers = {'X-Access': _connectionData.accessKey};
    try {
      final uri = Uri.parse('${_connectionData.address}/rpc');
      var response = await post(
        uri,
        body: jsonEncode(params),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }
}
