class Invoice {
  final int id;
  final String customerName;
  final DateTime invoiceDate;
  final int paymentMethod;
  final String? referenceNumber;
  final String? memo;
  final double? discount;
  final int? discountType;
  final DateTime creationDate;
  final DateTime? paymentDate;
  final double amountDue;
  final double? amountPaid;
  final int creatorId;

  Invoice({
    required this.id,
    required this.customerName,
    required this.invoiceDate,
    required this.paymentMethod,
    this.referenceNumber,
    this.memo,
    this.discount,
    this.discountType,
    required this.creationDate,
    this.paymentDate,
    required this.amountDue,
    this.amountPaid,
    required this.creatorId,
  });

  Invoice copyWith({
    int? id,
    String? customerName,
    DateTime? invoiceDate,
    int? paymentMethod,
    String? referenceNumber,
    String? memo,
    double? discount,
    int? discountType,
    DateTime? creationDate,
    DateTime? paymentDate,
    double? amountDue,
    double? amountPaid,
    int? creatorId,
  }) {
    return Invoice(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      memo: memo ?? this.memo,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      creationDate: creationDate ?? this.creationDate,
      paymentDate: paymentDate ?? this.paymentDate,
      amountDue: amountDue ?? this.amountDue,
      amountPaid: amountPaid ?? this.amountPaid,
      creatorId: creatorId ?? this.creatorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer_name': customerName,
      'invoice_date': invoiceDate.toIso8601String(),
      'payment_method': paymentMethod,
      'reference_number': referenceNumber,
      'memo': memo,
      'discount': discount,
      'discount_type': discountType,
      'creation_date': creationDate.toIso8601String(),
      'payment_date': paymentDate?.toIso8601String(),
      'amount_due': amountDue,
      'amount_paid': amountPaid,
      'creator_id': creatorId,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'],
      customerName: map['customer_name'],
      invoiceDate: DateTime.parse(map['invoice_date']),
      paymentMethod: map['payment_method'],
      referenceNumber: map['reference_number'],
      memo: map['memo'],
      discount: map['discount'],
      discountType: map['discount_type'],
      creationDate: DateTime.parse(map['creation_date']),
      paymentDate: map['payment_date'] != null ? DateTime.parse(map['payment_date']) : null,
      amountDue: map['amount_due'],
      amountPaid: map['amount_paid'],
      creatorId: map['creator_id'],
    );
  }
}
