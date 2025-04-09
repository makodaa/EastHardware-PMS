import 'package:uuid/uuid.dart';

class Order {
  final int id;
  final String uid;
  final String payeeName;
  final int expenseType;
  final DateTime orderDate;
  final int paymentMethod;
  final String? referenceNumber;
  final String? memo;
  final double amountDue;
  final double? amountPaid;
  final DateTime? paymentDate;
  final DateTime creationDate;
  final int creatorId;

  Order({
    String? uid,
    required this.id,
    required this.payeeName,
    required this.expenseType,
    required this.orderDate,
    required this.paymentMethod,
    required this.referenceNumber,
    this.memo,
    required this.amountDue,
    this.amountPaid,
    this.paymentDate,
    required this.creationDate,
    required this.creatorId,
  }) : uid = uid ?? const Uuid().v4();
  Order copyWith({
    int? id,
    String? uid,
    String? payeeName,
    int? expenseType,
    DateTime? orderDate,
    int? paymentMethod,
    String? referenceNumber,
    String? memo,
    double? amountDue,
    double? amountPaid,
    DateTime? paymentDate,
    DateTime? creationDate,
    int? creatorId,
  }) {
    return Order(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      payeeName: payeeName ?? this.payeeName,
      expenseType: expenseType ?? this.expenseType,
      orderDate: orderDate ?? this.orderDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      memo: memo ?? this.memo,
      amountDue: amountDue ?? this.amountDue,
      amountPaid: amountPaid ?? this.amountPaid,
      paymentDate: paymentDate ?? this.paymentDate,
      creationDate: creationDate ?? this.creationDate,
      creatorId: creatorId ?? this.creatorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'payee_name': payeeName,
      'expense_type': expenseType,
      'order_date': orderDate.toIso8601String(),
      'payment_method': paymentMethod,
      'reference_number': referenceNumber,
      'memo': memo,
      'amount_due': amountDue,
      'amount_paid': amountPaid,
      'payment_date': paymentDate?.toIso8601String(),
      'creation_date': creationDate.toIso8601String(),
      'creator_id': creatorId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      uid: map['uid'],
      payeeName: map['payee_name'],
      expenseType: map['expense_type'],
      orderDate: DateTime.parse(map['order_date']),
      paymentMethod: map['payment_method'],
      referenceNumber: map['reference_number'],
      memo: map['memo'],
      amountDue: map['amount_due'],
      amountPaid: map['amount_paid'],
      paymentDate: map['payment_date'] != null ? DateTime.parse(map['payment_date']) : null,
      creationDate: DateTime.parse(map['creation_date']),
      creatorId: map['creator_id'],
    );
  }
}
