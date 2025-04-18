class Unit {
  final int? id;
  final int? productId;
  final String name;
  final double factor;

  Unit({
    this.id,
    this.productId,
    required this.name,
    required this.factor,
  });

  Unit copyWith({
    int? id,
    int? productId,
    String? name,
    double? factor,
  }) {
    return Unit(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      factor: factor ?? this.factor,
    );
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] as int,
      productId: map['product_id'] as int,
      name: map['name'] as String,
      factor: map['conversion_factor'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'conversion_factor': factor,
    };
  }
}
