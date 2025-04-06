class Product {
  final int id;
  final String name;
  final int? category;
  final String? description;
  final double salePrice;
  final double orderCost;
  final double quantity;
  final String mainUnit;
  final double criticalLevel;
  final int deadStockThreshold;
  final int fastMovingStockThreshold;
  final String creationDate;
  final int userId;
  final int archiveStatus;
  final int? isBelowCriticalLevel;
  final int? isFastMovingStock;
  final int? isDeadStock;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.salePrice,
    required this.orderCost,
    required this.quantity,
    required this.mainUnit,
    required this.criticalLevel,
    required this.deadStockThreshold,
    required this.fastMovingStockThreshold,
    required this.creationDate,
    required this.userId,
    required this.archiveStatus,
    this.isBelowCriticalLevel,
    this.isFastMovingStock,
    this.isDeadStock,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'salePrice': salePrice,
      'orderCost': orderCost,
      'quantity': quantity,
      'mainUnit': mainUnit,
      'description': description,
      'criticalLevel': criticalLevel,
      'deadStockThreshold': deadStockThreshold,
      'fastMovingStockThreshold': fastMovingStockThreshold,
      'creationDate': creationDate,
      'userId': userId,
      'archiveStatus': archiveStatus,
      'isBelowCriticalLevel': isBelowCriticalLevel,
      'isFastMovingStock': isFastMovingStock,
      'isDeadStock': isDeadStock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as int?,
      description: map['description'] as String?,
      salePrice: map['salePrice'] as double,
      orderCost: map['orderCost'] as double,
      quantity: map['quantity'] as double,
      mainUnit: map['mainUnit'] as String,
      criticalLevel: map['criticalLevel'] as double,
      deadStockThreshold: map['deadStockThreshold'] as int,
      fastMovingStockThreshold: map['fastMovingStockThreshold'] as int,
      creationDate: map['creationDate'] as String,
      userId: map['userId'] as int,
      archiveStatus: map['archiveStatus'] as int,
      isBelowCriticalLevel: map['isBelowCriticalLevel'] as int?,
      isFastMovingStock: map['isFastMovingStock'] as int?,
      isDeadStock: map['isDeadStock'] as int?,
    );
  }
}
