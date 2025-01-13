import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ProductsTable {
  static const String PRODUCTS_TABLE_NAME = 'users';
  static const String PRODUCTS_ID = 'id';
  static const String PRODUCTS_SKU = 'sku';
  static const String PRODUCTS_CATEGORY = 'category';
  static const String PRODUCTS_DESCRIPTION = 'description';
  static const String PRODUCTS_SALE_PRICE = 'sale_price';
  static const String PRODUCTS_ORDER_COST = 'order_cost';
  static const String PRODUCTS_QUANTITY = 'product_quantity';
  static const String PRODUCTS_CRITICAL_LEVEL = 'critical_level';
  static const String PRODUCTS_DEAD_STOCK_THRESHOLD = 'dead_stock_treshold';
  static const String PRODUCTS_FAST_MOVING_PERIOD = 'fast_moving_period';
  static const String PRODUCTS_CREATION_DATE = 'creation_date';
  static const String PRODUCTS_USER_ID = 'user_id';
  static const String PRODUCTS_ARCHIVE_STATUS = 'archive_status';

  static void createTable(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $PRODUCTS_TABLE_NAME (
      $PRODUCTS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $PRODUCTS_SKU TEXT NOT NULL,
      $PRODUCTS_CATEGORY TEXT NOT NULL,
      $PRODUCTS_DESCRIPTION TEXT,
      $PRODUCTS_SALE_PRICE REAL NOT NULL,
      $PRODUCTS_ORDER_COST REAL NOT NULL,
      $PRODUCTS_QUANTITY REAL NOT NULL,
      $PRODUCTS_CRITICAL_LEVEL REAL NOT NULL,
      $PRODUCTS_DEAD_STOCK_THRESHOLD INTEGER NOT NULL,
      $PRODUCTS_FAST_MOVING_PERIOD INTEGER NOT NULL,
      $PRODUCTS_CREATION_DATE TEXT NOT NULL,
      $PRODUCTS_USER_ID INTEGER NOT NULL,
      $PRODUCTS_ARCHIVE_STATUS INTEGER NOT NULL
    )
    )
  ''');
  }
}
