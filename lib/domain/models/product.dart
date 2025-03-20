import 'dart:ffi';

class Product {
  final int id;
  final String name;
  final String? category;
  final String? description;
  final double salePrice;
  final double orderCost;
  final double quantity;
  final double criticalLevel;

  Product(
      {required this.id,
      required this.name,
      this.category,
      this.description,
      required this.salePrice,
      required this.orderCost,
      required this.quantity,
      required this.criticalLevel});
  // TODO: Add creation date, userid, archive status

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    double? salePrice,
    double? orderCost,
    double? quantity,
    double? criticalLevel,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: this.category,
      description: this.description,
      salePrice: salePrice ?? this.salePrice,
      orderCost: orderCost ?? this.orderCost,
      quantity: quantity ?? this.quantity,
      criticalLevel: criticalLevel ?? this.criticalLevel,
    );
  }
}
