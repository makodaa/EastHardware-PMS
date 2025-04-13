class PaymentMethod {
  final int? id;
  final String name;

  PaymentMethod({
    this.id,
    required this.name,
  });
  PaymentMethod copyWith({
    int? id,
    String? name,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
