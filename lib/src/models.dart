enum WalletType {
  empty,
  lnd,
  cln,
  eclair,
}

class WalletBalance {
  final int totalBalance;
  final int onchainBalance;
  final int channelBalance;

  WalletBalance(
    this.totalBalance,
    this.onchainBalance,
    this.channelBalance,
  );
}

class InvoiceData {
  final String id;
  final String preimage;
  final String bolt11;
  final DateTime expiry;

  InvoiceData({
    required this.id,
    required this.preimage,
    required this.bolt11,
    required this.expiry,
  });
}

class InvoiceStatus {
  final String checkingID;
  final bool exists;
  final bool paid;
  final int mSatReceived;

  InvoiceStatus(this.checkingID, this.exists, this.paid, this.mSatReceived);
}

class PaymentStatusResult {
  final bool found;
  final String? error;
  final Payment? payment;

  PaymentStatusResult(this.found, {this.error, this.payment});
}

enum PaymentStatus {
  pending,
  completed,
  failed,
}

class Payment {
  String? bolt11;
  String? bolt12;
  String? label;
  String destination;
  String paymentHash;
  PaymentStatus status;
  DateTime createdAt;
  String? preimage;
  int? amountMsat;
  int? amountSentMsat;
  String? error;
  Payment({
    this.bolt11,
    this.bolt12,
    this.label,
    required this.destination,
    required this.paymentHash,
    required this.status,
    required this.createdAt,
    this.preimage,
    this.amountMsat,
    this.amountSentMsat,
  });
}

class SourceError extends Error {
  final String message;

  SourceError([this.message = '']);
}

class DecodedInvoice {
  final String type;
  final String currency;
  final int createdAt;
  final int expiry;
  final String payee;
  final int msatoshi;
  final String amountMsat;
  final String description;
  final int minFinalCltvExpiry;
  final String paymentSecret;
  final String features;
  final List<List<Hop>> routes;
  final String paymentHash;
  final String signature;
  final bool valid;

  DecodedInvoice({
    required this.type,
    required this.currency,
    required this.createdAt,
    required this.expiry,
    required this.payee,
    required this.msatoshi,
    required this.amountMsat,
    required this.description,
    required this.minFinalCltvExpiry,
    required this.paymentSecret,
    required this.features,
    required this.routes,
    required this.paymentHash,
    required this.signature,
    required this.valid,
  });
}

class Hop {
  final String pubkey;
  final String shortChannelId;
  final int feeBaseMsat;
  final int feeProportionalMillionths;
  final int cltvExpiryDelta;

  Hop({
    required this.pubkey,
    required this.shortChannelId,
    required this.feeBaseMsat,
    required this.feeProportionalMillionths,
    required this.cltvExpiryDelta,
  });
}
