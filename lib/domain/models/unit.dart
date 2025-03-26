class Unit {
  final int id;
  final int product;
  final String name;
  final double conversionFactor;

  Unit({
    required this.id,
    required this.product,
    required this.name,
    required this.conversionFactor,
  });

  Unit copyWith({
    int? id,
    int? product,
    String? name,
    double? conversionFactor,
  }) {
    return Unit(
      id: id ?? this.id,
      product: product ?? this.product,
      name: name ?? this.name,
      conversionFactor: conversionFactor ?? this.conversionFactor,
    );
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] as int,
      product: map['product'] as int,
      name: map['name'] as String,
      conversionFactor: map['conversionFactor'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product,
      'name': name,
      'conversionFactor': conversionFactor,
    };
  }
}
