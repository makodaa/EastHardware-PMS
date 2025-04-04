class OrderProduct {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final String? description;
  final double quantity;
  final int? secondaryUnit;
  final double? conversionFactor;
  final double rate;
  final double amount;

  OrderProduct({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    this.description,
    required this.quantity,
    this.secondaryUnit,
    this.conversionFactor,
    required this.rate,
    required this.amount,
  });

  OrderProduct copyWith({
    int? id,
    int? orderId,
    int? productId,
    String? productName,
    String? description,
    double? quantity,
    int? secondaryUnit,
    double? conversionFactor,
    double? rate,
    double? amount,
  }) {
    return OrderProduct(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      secondaryUnit: secondaryUnit ?? this.secondaryUnit,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'product_name': productName,
      'description': description,
      'quantity': quantity,
      'secondary_unit': secondaryUnit,
      'conversion_factor': conversionFactor,
      'rate': rate,
      'amount': amount,
    };
  }

  factory OrderProduct.fromMap(Map<String, dynamic> map) {
    return OrderProduct(
      id: map['id'],
      orderId: map['order_id'],
      productId: map['product_id'],
      productName: map['product_name'],
      description: map['description'],
      quantity: map['quantity'],
      secondaryUnit: map['secondary_unit'],
      conversionFactor: map['conversion_factor'],
      rate: map['rate'],
      amount: map['amount'],
    );
  }
}
