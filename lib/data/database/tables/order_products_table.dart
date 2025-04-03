import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Represents the list of products in a restock order
/// If [ORDER_PRODUCTS_SECONDARY_UNIT] is null, main unit will be used, or conversion will be set to 1.
class OrderProductsTable {
  static const String TABLE_NAME = 'order_products';
  static const String ORDER_PRODUCTS_ID = 'id';
  static const String ORDER_PRODUCTS_ORDER = 'order_id';
  static const String ORDER_PRODUCTS_PRODUCT = 'product_id';
  static const String ORDER_PRODUCTS_NAME = 'product_name';
  static const String ORDER_PRODUCTS_DESCRIPTION = 'description';
  static const String ORDER_PRODUCTS_QUANTITY = 'quantity';
  static const String ORDER_PRODUCTS_SECONDARY_UNIT = 'secondary_unit';
  static const String ORDER_PRODUCTS_RATE = 'rate';
  static const String ORDER_PRODUCTS_AMOUNT = 'amount';

  static void createTable(Database database) async {
    await database.execute('''
  CREATE TABLE $TABLE_NAME (
  $ORDER_PRODUCTS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  $ORDER_PRODUCTS_ORDER INTEGER NOT NULL,
  $ORDER_PRODUCTS_PRODUCT INTEGER NOT NULL,
  $ORDER_PRODUCTS_NAME TEXT NOT NULL,
  $ORDER_PRODUCTS_DESCRIPTION TEXT,
  $ORDER_PRODUCTS_QUANTITY REAL NOT NULL,
  $ORDER_PRODUCTS_RATE REAL NOT NULL,
  $ORDER_PRODUCTS_AMOUNT REAL NOT NULL
  )
''');
  }
}
