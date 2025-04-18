class Product {
  final int? id;
  final String name;
  final int? category;
  final String sku;
  final String? description;
  final double salePrice;
  final double orderCost;
  final double quantity;
  final String mainUnit;
  final double criticalLevel;
  final double deadStockThreshold;
  final double fastMovingStockThreshold;
  final String creationDate;
  final int creatorId;
  final int archiveStatus;
  final bool? isBelowCriticalLevel;
  final bool? isFastMovingStock;
  final bool? isDeadStock;

  Product({
    this.id,
    required this.sku,
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
    required this.creatorId,
    required this.archiveStatus,
    this.isBelowCriticalLevel,
    this.isFastMovingStock,
    this.isDeadStock,
  });

  Product copyWith({
    int? id,
    String? name,
    String? sku,
    int? category,
    String? description,
    double? salePrice,
    double? orderCost,
    double? quantity,
    String? mainUnit,
    double? criticalLevel,
    double? deadStockThreshold,
    double? fastMovingStockThreshold,
    String? creationDate,
    int? creatorId,
    int? archiveStatus,
    bool? isBelowCriticalLevel,
    bool? isFastMovingStock,
    bool? isDeadStock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      category: category ?? this.category,
      description: description ?? this.description,
      salePrice: salePrice ?? this.salePrice,
      orderCost: orderCost ?? this.orderCost,
      quantity: quantity ?? this.quantity,
      mainUnit: mainUnit ?? this.mainUnit,
      criticalLevel: criticalLevel ?? this.criticalLevel,
      deadStockThreshold: deadStockThreshold ?? this.deadStockThreshold,
      fastMovingStockThreshold: fastMovingStockThreshold ?? this.fastMovingStockThreshold,
      creationDate: creationDate ?? this.creationDate,
      creatorId: creatorId ?? this.creatorId,
      archiveStatus: archiveStatus ?? this.archiveStatus,
      isBelowCriticalLevel: isBelowCriticalLevel ?? this.isBelowCriticalLevel,
      isFastMovingStock: isFastMovingStock ?? this.isFastMovingStock,
      isDeadStock: isDeadStock ?? this.isDeadStock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'sku': sku,
      'sale_price': salePrice,
      'order_cost': orderCost,
      'quantity': quantity,
      'main_unit': mainUnit,
      'description': description,
      'critical_level': criticalLevel,
      'dead_stock_threshold': deadStockThreshold,
      'fast_moving_threshold': fastMovingStockThreshold,
      'creation_date': creationDate,
      'creator_id': creatorId,
      'archive_status': archiveStatus,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      sku: map['sku'] as String,
      category: map['category'] as int?,
      description: map['description'] as String?,
      salePrice: map['sale_price'] as double,
      orderCost: map['order_cost'] as double,
      quantity: map['quantity'] as double,
      mainUnit: map['main_unit'] as String,
      criticalLevel: map['critical_level'] as double,
      deadStockThreshold: map['dead_stock_threshold'] as double,
      fastMovingStockThreshold: map['fast_moving_threshold'] as double,
      creationDate: map['creation_date'] as String,
      creatorId: map['creator_id'] as int,
      archiveStatus: map['archive_status'] as int,
      isBelowCriticalLevel: map['is_below_critical_level'] == 1,
      isFastMovingStock: map['is_fast_moving_stock'] == 1,
      isDeadStock: map['is_dead_stock'] == 1,
    );
  }
}
