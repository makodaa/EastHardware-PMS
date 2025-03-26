import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UnitsTable {
  static const String UNITS_TABLE_NAME = 'units';
  static const String UNITS_ID = 'id';
  static const String UNITS_NAME = 'name';
  static const String UNITS_PRODUCT_ID = 'product_id';
  static const String UNITS_CONVERSION_FACTOR = 'conversion_factor';

  static void createUnitsTable(Database database) async {
    await database.execute('''
    CREATE TABLE $UNITS_TABLE_NAME (
    $UNITS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    $UNITS_NAME TEXT NOT NULL,
    $UNITS_PRODUCT_ID INTEGER NOT NULL,
    $UNITS_CONVERSION_FACTOR REAL NOT NULL
    )
    ''');
  }
}
