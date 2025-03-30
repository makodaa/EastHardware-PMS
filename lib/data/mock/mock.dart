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

  static List<Product> products = [];
}
