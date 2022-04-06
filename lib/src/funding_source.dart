import 'dart:async';

import 'models.dart';

abstract class ConnectionData {}

abstract class FundingSource {
  FutureOr<void> connect(ConnectionData data) async =>
      throw UnimplementedError();
  FutureOr<void> dispose() async => throw UnimplementedError();

  WalletType type() => throw UnimplementedError();
  FutureOr<WalletBalance> walletBalance() async => throw UnimplementedError();

  FutureOr<InvoiceData> createInvoice({
    required int mSat,
    String memo = '',
    String? internalId,
    DateTime? expiry,
  }) async =>
      throw UnimplementedError();
  FutureOr<InvoiceStatus> invoiceStatus(String invoice) async =>
      throw UnimplementedError();
  FutureOr<Stream<dynamic>> invoicesPaidStream() async =>
      throw UnimplementedError();
  FutureOr<DecodedInvoice> decodeInvoice(String bolt11) async =>
      throw UnimplementedError();
  FutureOr<List<InvoiceStatus>> listInvoices() async =>
      throw UnimplementedError();

  FutureOr<Payment> sendPayment(String invoice, {int amount = 0}) async =>
      throw UnimplementedError();
  FutureOr<PaymentStatusResult> paymentStatus(
          {String? bolt11, String? paymentHash}) async =>
      throw UnimplementedError();
  FutureOr<Stream<dynamic>> paymentsStream() async =>
      throw UnimplementedError();
}
