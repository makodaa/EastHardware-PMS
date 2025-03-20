import 'dart:typed_data';

import 'package:easthardware_pms/domain/models/product.dart';
import 'package:easthardware_pms/domain/models/user.dart';

class Mock {
  static User user = User(
    0,
    "Gerald",
    "Anonymous",
    "Ganon",
    AccessLevel.administrator,
    Uint8List.fromList([1, 2, 3]),
    Uint8List.fromList([1, 2, 3]),
  );

  static List<Product> products = [
    Product(id: 0, name: 'Steel', salePrice: 0.0, orderCost: 0.0, quantity: 10, criticalLevel: 1),
    Product(id: 0, name: 'Cement', salePrice: 0.0, orderCost: 0.0, quantity: 10, criticalLevel: 1),
    Product(id: 0, name: 'Gravel', salePrice: 0.0, orderCost: 0.0, quantity: 10, criticalLevel: 1),
    Product(id: 0, name: 'Wood', salePrice: 0.0, orderCost: 0.0, quantity: 100, criticalLevel: 10)
  ];
}
