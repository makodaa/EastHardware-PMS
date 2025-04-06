import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/invoice_product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class InvoiceProductsDao {
  Future<List<InvoiceProduct?>> getAllInvoiceProducts();
  Future<InvoiceProduct?> getInvoiceProductById(int id);
  Future<List<InvoiceProduct?>> getInvoiceProductsByInvoiceId(int invoiceId);
  Future<void> insertInvoiceProduct(InvoiceProduct invoiceProduct);
  Future<void> updateInvoiceProduct(InvoiceProduct invoiceProduct);
  Future<void> deleteInvoiceProduct(int id);
}

// This class would implement the InvoiceProductsDao interface
// and provide the actual database operations using a database library.
class InvoiceProductsDaoImpl extends InvoiceProductsDao {
  final DatabaseHelper _databaseHelper;
  InvoiceProductsDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  /// This method retrieves all invoice products from the database.
  /// It returns a list of [InvoiceProduct] objects.
  /// If no invoice products are found, it returns an empty list.
  ///
  @override
  Future<List<InvoiceProduct?>> getAllInvoiceProducts() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('invoice_products');
    return List.generate(maps.length, (i) {
      return InvoiceProduct.fromMap(maps[i]);
    });
  }

  /// This method retrieves a specific invoice product by its ID.
  /// It returns an [InvoiceProduct] object if found, otherwise null.
  ///
  @override
  Future<InvoiceProduct?> getInvoiceProductById(int id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoice_products',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return InvoiceProduct.fromMap(maps.first);
    }
    return null;
  }

  /// This method retrieves all invoice products associated with a specific invoice ID.
  /// It returns a list of [InvoiceProduct] objects.
  /// If no invoice products are found, it returns an empty list.
  ///
  @override
  Future<List<InvoiceProduct?>> getInvoiceProductsByInvoiceId(int invoiceId) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoice_products',
      where: 'invoice_id = ?',
      whereArgs: [invoiceId],
    );
    return List.generate(maps.length, (i) {
      return InvoiceProduct.fromMap(maps[i]);
    });
  }

  /// This method inserts a new invoice product into the database.
  /// It takes an [InvoiceProduct] object as a parameter.
  /// It returns a Future that completes when the operation is done.
  /// If the operation fails, it throws an exception.
  ///
  @override
  Future<void> insertInvoiceProduct(InvoiceProduct invoiceProduct) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'invoice_products',
      invoiceProduct.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  /// This method updates an existing invoice product in the database.
  /// It takes an [InvoiceProduct] object as a parameter.
  /// It returns a Future that completes when the operation is done.
  /// If the operation fails, it throws an exception.
  ///
  @override
  Future<void> updateInvoiceProduct(InvoiceProduct invoiceProduct) async {
    final db = await _databaseHelper.database;
    await db.update(
      'invoice_products',
      invoiceProduct.toMap(),
      where: 'id = ?',
      whereArgs: [invoiceProduct.id],
    );
  }

  /// This method deletes an invoice product from the database.
  /// It takes the ID of the invoice product as a parameter.
  /// It returns a Future that completes when the operation is done.
  /// If the operation fails, it throws an exception.
  ///
  @override
  Future<void> deleteInvoiceProduct(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'invoice_products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
