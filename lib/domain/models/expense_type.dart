class ExpenseType {
  final int id;
  final String name;

  ExpenseType({
    required this.id,
    required this.name,
  });
  ExpenseType copyWith({
    int? id,
    String? name,
  }) {
    return ExpenseType(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
    };
  }

  //from map to object
  factory ExpenseType.fromMap(Map<String, dynamic> map) {
    return ExpenseType(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
