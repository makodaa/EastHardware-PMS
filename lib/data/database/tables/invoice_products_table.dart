import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Represents the List of Products an Invoice Contains
/// Allows Discount per Item
/// [INVOICE_PRODUCTS_SECONDARY_UNIT] if Null, will use the product main units instead
class InvoiceProductsTable {
  static const String TABLE_NAME = 'invoice_products';
  static const String INVOICE_PRODUCTS_ID = 'id';
  static const String INVOICE_PRODUCTS_INVOICE = 'invoice_id';
  static const String INVOICE_PRODUCTS_PRODUCT = 'product_id';
  static const String INVOICE_PRODUCTS_NAME = 'product_name';
  static const String INVOICE_PRODUCTS_DESCRIPTION = 'description';
  static const String INVOICE_PRODUCTS_DISCOUNT = 'discount';
  static const String INVOICE_PRODUCTS_DISCOUNT_TYPE = 'discount_type';
  static const String INVOICE_PRODUCTS_QUANTITY = 'quantity';
  static const String INVOICE_PRODUCTS_SECONDARY_UNIT = 'secondary_unit';
  static const String INVOICE_PRODUCTS_RATE = 'rate';
  static const String INVOICE_PRODUCTS_AMOUNT = 'amount';

  static void createTable(Database database) async {
    await database.execute('''
  CREATE TABLE $TABLE_NAME (
  $INVOICE_PRODUCTS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  $INVOICE_PRODUCTS_INVOICE INTEGER NOT NULL,
  $INVOICE_PRODUCTS_PRODUCT INTEGER NOT NULL,
  $INVOICE_PRODUCTS_NAME TEXT NOT NULL,
  $INVOICE_PRODUCTS_DESCRIPTION TEXT,
  $INVOICE_PRODUCTS_DISCOUNT REAL,
  $INVOICE_PRODUCTS_DISCOUNT_TYPE INTEGER,
  $INVOICE_PRODUCTS_QUANTITY REAL NOT NULL,
  $INVOICE_PRODUCTS_SECONDARY_UNIT INTEGER,
  $INVOICE_PRODUCTS_RATE REAL NOT NULL,
  $INVOICE_PRODUCTS_AMOUNT REAL NOT NULL
  )
''');
  }
}
