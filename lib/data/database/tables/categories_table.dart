import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CategoriesTable {
  static const String CATEGORIES_TABLE_NAME = "categories";
  static const String CATEGORIES_ID = "id";
  static const String CATEGORIES_NAME = "name";

  static void createTable(Database database) async {
    await database.execute('''
    CREATE TABLE $CATEGORIES_TABLE_NAME (
    $CATEGORIES_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    $CATEGORIES_NAME TEXT NOT NULL
    )
''');
  }
}
