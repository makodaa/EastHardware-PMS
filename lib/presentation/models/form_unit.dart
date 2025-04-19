import 'package:easthardware_pms/domain/models/unit.dart';

class FormUnit {
  final String name;
  final String factor;

  FormUnit({
    required this.name,
    required this.factor,
  });
  FormUnit copyWith({
    String? name,
    String? factor,
  }) {
    return FormUnit(
      name: name ?? this.name,
      factor: factor ?? this.factor,
    );
  }

  // From FormUnit to Unit Data Entity
  Unit toUnit(int productId) {
    return Unit(
      name: name,
      productId: productId,
      factor: double.parse(factor),
    );
  }

  factory FormUnit.fromUnit(Unit unit) {
    return FormUnit(
      name: unit.name,
      factor: unit.factor.toString(),
    );
  }
}
