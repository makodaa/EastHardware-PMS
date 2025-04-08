class Unit {
  final int id;
  final int productId;
  final String name;
  final double conversionFactor;

  Unit({
    required this.id,
    required this.productId,
    required this.name,
    required this.conversionFactor,
  });

  Unit copyWith({
    int? id,
    int? productId,
    String? name,
    double? conversionFactor,
  }) {
    return Unit(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      conversionFactor: conversionFactor ?? this.conversionFactor,
    );
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] as int,
      productId: map['product_id'] as int,
      name: map['name'] as String,
      conversionFactor: map['conversion_factor'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'conversion_factor': conversionFactor,
    };
  }
}
