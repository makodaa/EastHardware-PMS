import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/invoice.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class InvoicesDao {
  Future<List<Invoice?>> getAllInvoices();
  Future<Invoice?> getInvoiceById(int id);
  Future<void> insertInvoice(Invoice invoice);
  Future<void> updateInvoice(Invoice invoice);
  Future<void> deleteInvoice(int id);
  Future<List<Invoice?>> getInvoicesByCustomerName(String customerName);
  Future<List<Invoice?>> getInvoicesByDateRange(DateTime startDate, DateTime endDate);
  Future<List<Invoice?>> getInvoicesByPaymentMethod(String paymentMethod);
  Future<List<Invoice?>> getInvoicesByAmountDue(double minAmount, double maxAmount);
  Future<List<Invoice?>> getInvoicesByCreatorId(int creatorId);
  Future<List<Invoice?>> getInvoicesByProductIds(List<int> productIds);
  Future<List<Invoice?>> getInvoiceByProductCategory(int categoryId);
}

/// The [InvoicesDaoImpl] class implements the [InvoicesDao] interface
/// and provides methods to interact with the invoices table in the database.
/// It uses the [DatabaseHelper] class to get a reference to the database.
///
class InvoicesDaoImpl extends InvoicesDao {
  final DatabaseHelper _databaseHelper;
  InvoicesDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  /// Returns a list of all invoices in the database.
  ///
  @override
  Future<List<Invoice?>> getAllInvoices() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('invoices');
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns an invoice by its ID.
  /// If no invoice is found, returns null.
  ///
  @override
  Future<Invoice?> getInvoiceById(int id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoices',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Invoice.fromMap(maps.first);
    }
    return null;
  }

  /// Inserts a new invoice into the database.
  /// TODO: Handle the case where the invoice already exists.
  @override
  Future<void> insertInvoice(Invoice invoice) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'invoices',
      invoice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  /// Updates an existing invoice in the database.
  /// TODO: Handle the case where the invoice does not exist.
  @override
  Future<void> updateInvoice(Invoice invoice) async {
    final db = await _databaseHelper.database;
    await db.update(
      'invoices',
      invoice.toMap(),
      where: 'id = ?',
      whereArgs: [invoice.id],
    );
  }

  /// Deletes an invoice from the database by its ID.
  /// TODO: Handle the case where the invoice does not exist.
  @override
  Future<void> deleteInvoice(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'invoices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Returns a list of invoices by date range.
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoicesByDateRange(DateTime startDate, DateTime endDate) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoices',
      where: 'invoice_date BETWEEN ? AND ?',
      whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by payment method.
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoicesByPaymentMethod(String paymentMethod) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoices',
      where: 'payment_method = ?',
      whereArgs: [paymentMethod],
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by total amount.
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoicesByAmountDue(double minAmount, double maxAmount) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoices',
      where: 'amount_due BETWEEN ? AND ?',
      whereArgs: [minAmount, maxAmount],
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by created by user ID.
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoicesByCreatorId(int createdBy) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'invoices',
      where: 'creator_id = ?',
      whereArgs: [createdBy],
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by product IDs.
  /// If no invoices are found, returns an empty list.
  ///

  @override
  Future<List<Invoice?>> getInvoicesByProductIds(List<int> productIds) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT DISTINCT invoices.* FROM invoices '
      'JOIN invoice_products ON invoices.id = invoice_products.invoice_id '
      'WHERE invoice_products.product_id IN (${productIds.join(',')})',
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by product category ID.
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoiceByProductCategory(int categoryId) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT DISTINCT invoices.* FROM invoices '
      'JOIN invoice_products ON invoices.id = invoice_products.invoice_id '
      'JOIN products ON invoice_products.product_id = products.id '
      'WHERE products.category_id = ?',
      [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }

  /// Returns a list of invoices by customer name
  /// If no invoices are found, returns an empty list.
  ///
  @override
  Future<List<Invoice?>> getInvoicesByCustomerName(String customerName) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps =
        await db.query('invoices', where: 'customer_name = ?', whereArgs: [customerName]);
    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }
}
