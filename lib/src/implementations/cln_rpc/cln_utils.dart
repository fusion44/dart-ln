part of 'cln_rpc_implementation.dart';

WalletBalance _getWalletBalance(Map<String, dynamic> funds) {
  if (!funds.containsKey('result')) {
    throw StateError('listfunds map must contain a result key');
  }

  final res = funds['result'];
  if (res is! Map<String, dynamic>) {
    throw StateError('listfunds map result is not a Map<String, dynamic>');
  }

  var total = 0;
  var onchain = 0;
  var channels = 0;

  if (res.containsKey('outputs')) {
    for (final o in res['outputs']) {
      if (o is! Map<String, dynamic> || !o.containsKey('amount_msat')) {
        continue;
      }

      final a = int.parse(o['amount_msat'].toString().replaceAll('msat', ''));
      total += a;
      onchain += a;
    }
  }

  if (res.containsKey('channels')) {
    for (final o in res['channels']) {
      if (o is! Map<String, dynamic> || !o.containsKey('our_amount_msat')) {
        continue;
      }

      final a =
          int.parse(o['our_amount_msat'].toString().replaceAll('msat', ''));
      total += a;
      channels += a;
    }
  }

  return WalletBalance(total, onchain, channels);
}

DecodedInvoice _getDecodedInvoiceFromJson(Map<String, dynamic> json) {
  return DecodedInvoice(
    type: json['type'],
    currency: json['currency'],
    createdAt: json['created_at'],
    expiry: json['expiry'],
    payee: json['payee'],
    msatoshi: json['msatoshi'],
    amountMsat: json['amount_msat'],
    description: json['description'],
    minFinalCltvExpiry: json['min_final_cltv_expiry'],
    paymentSecret: json['payment_secret'],
    features: json['features'],
    routes: _getRoutesList(json['routes']),
    paymentHash: json['payment_hash'],
    signature: json['signature'],
    valid: json['valid'],
  );
}

List<List<Hop>> _getRoutesList(List<dynamic> jsonList) {
  List<List<Hop>> routes = [];
  for (var routeList in jsonList) {
    List<Hop> route = [];
    for (var hop in routeList) {
      route.add(_getRouteFromJson(hop));
    }
    routes.add(route);
  }
  return routes;
}

Hop _getRouteFromJson(Map<String, dynamic> json) {
  return Hop(
    pubkey: json['pubkey'],
    shortChannelId: json['short_channel_id'],
    feeBaseMsat: json['fee_base_msat'],
    feeProportionalMillionths: json['fee_proportional_millionths'],
    cltvExpiryDelta: json['cltv_expiry_delta'],
  );
}

Payment _getPaymentFromJson(Map<String, dynamic> json) {
  late DateTime createdAt;
  if (json['created_at'] is int) {
    createdAt = DateTime.fromMillisecondsSinceEpoch(json['created_at'] * 1000);
  } else if (json['created_at'] is double) {
    createdAt =
        DateTime.fromMillisecondsSinceEpoch(json['created_at'] * 1000.0);
  }
  return Payment(
    bolt11: json['bolt11'],
    bolt12: json['bolt12'],
    label: json['label'],
    destination: json['destination'] as String,
    paymentHash: json['payment_hash'] as String,
    status: _parsePaymentStatus(json['status'] as String),
    createdAt:
        DateTime.fromMillisecondsSinceEpoch((json['created_at'] as int) * 1000),
    preimage: json['preimage'],
    amountMsat: _parseMsat(json['amount_msat']),
    amountSentMsat: _parseMsat(json['amount_sent_msat']),
  );
}

PaymentStatus _parsePaymentStatus(String status) {
  switch (status) {
    case 'pending':
      return PaymentStatus.pending;
    case 'complete':
      return PaymentStatus.completed;
    case 'failed':
      return PaymentStatus.failed;
    default:
      throw ArgumentError('Unknown payment status: $status');
  }
}

int _parseMsat(String msat) {
  return int.parse(msat.replaceAll('msat', ''));
}
