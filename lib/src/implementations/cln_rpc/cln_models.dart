class CLNInvoiceList {
  List<CLNInvoice> invoices;

  CLNInvoiceList({required this.invoices});

  static CLNInvoiceList fromJson(Map<String, dynamic> json) {
    final i = <CLNInvoice>[];
    json['invoices'].forEach((v) {
      i.add(CLNInvoice.fromJson(v));
    });
    return CLNInvoiceList(invoices: i);
  }
}

class CLNInvoice {
  final String label;
  final String bolt11;
  final String paymentHash;
  final int msatoshi;
  final String amountMsat;
  final String status;
  final String description;
  final int expiresAt;
  final int? payIndex;

  CLNInvoice({
    required this.label,
    required this.bolt11,
    required this.paymentHash,
    required this.msatoshi,
    required this.amountMsat,
    required this.status,
    required this.description,
    required this.expiresAt,
    this.payIndex,
  });

  static CLNInvoice fromJson(Map<String, dynamic> json) => CLNInvoice(
        label: json['label'],
        bolt11: json['bolt11'],
        paymentHash: json['payment_hash'],
        msatoshi: json['msatoshi'],
        amountMsat: json['amount_msat'],
        status: json['status'],
        description: json['description'],
        expiresAt: json['expires_at'],
        payIndex: json.containsKey('pay_index') ? json['pay_index'] : null,
      );
}

class CLNInvoiceData {
  String? paymentHash;
  int? expiresAt;
  String? bolt11;
  String? paymentSecret;
  String? warningCapacity;

  CLNInvoiceData({
    this.paymentHash,
    this.expiresAt,
    this.bolt11,
    this.paymentSecret,
    this.warningCapacity,
  });

  bool valid() {
    if (paymentHash != null &&
        expiresAt != null &&
        bolt11 != null &&
        paymentSecret != null) {
      return true;
    }

    return false;
  }

  CLNInvoiceData.fromJson(Map<String, dynamic> json) {
    paymentHash = json['payment_hash'];
    expiresAt = json['expires_at'];
    bolt11 = json['bolt11'];
    paymentSecret = json['payment_secret'];
    warningCapacity = json['warning_capacity'];
  }
}
