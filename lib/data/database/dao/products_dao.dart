import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/data/database/tables/products_table.dart';
import 'package:easthardware_pms/domain/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class ProductsDao {
  Future<List<Product?>> getAllProducts();
  Future<List<Product?>> getLowStockProducts();
  Future<List<Product?>> getFastMovingProducts();
  Future<List<Product?>> getDeadStockProducts();
  Future<Product?> getProductById(int id);
  Future<bool> insertProduct(Product product);
  Future<bool> updateProduct(Product product);
  Future<bool> deleteProduct(int id);
}

class ProductsDaoImpl extends ProductsDao {
  final DatabaseHelper _databaseHelper;
  ProductsDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  @override
  Future<bool> deleteProduct(int id) async {
    final Database database = await _databaseHelper.database;
    var res = await database.delete(
      ProductsTable.PRODUCTS_TABLE_NAME,
      where: '${ProductsTable.PRODUCTS_ID} = ?',
      whereArgs: [id],
    );

    return res != 0;
  }

  @override
  Future<List<Product?>> getAllProducts() async {
    final Database database = await _databaseHelper.database;
    var queryResults = await database.query(ProductsTable.PRODUCTS_TABLE_NAME);

    return queryResults.map(Product.fromMap).toList();
  }

  @override
  Future<Product?> getProductById(int id) async {
    final Database database = await _databaseHelper.database;
    var queryResults = await database.query(
      ProductsTable.PRODUCTS_TABLE_NAME,
      where: '${ProductsTable.PRODUCTS_ID} = ?',
      whereArgs: [id],
    );

    try {
      var json = queryResults.single;

      return Product.fromMap(json);
    } on StateError {
      if (kDebugMode) {
        print("Found duplicate products for id $id!");
      }
      return null;
    }
  }

  @override
  Future<bool> insertProduct(Product product) async {
    final Database database = await _databaseHelper.database;
    int id = await database.insert(
      ProductsTable.PRODUCTS_TABLE_NAME,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );

    /// [jm] TODO: This is the problem. We need an id value for Product, BUT the id is created by the databse. Decisions decisions.
    /// [mk] DAO should not handle this issue
    /// [mk] Take id from last entry of product list state
    assert(id == product.id);

    return id == product.id;
  }

  @override
  Future<bool> updateProduct(Product product) async {
    final Database database = await _databaseHelper.database;
    int affected = await database.update(
      ProductsTable.PRODUCTS_TABLE_NAME,
      product.toMap(),
      where: '${ProductsTable.PRODUCTS_TABLE_NAME} = ?',
      whereArgs: [product.id],
    );

    assert(affected == 1, "This should only update one row.");

    return affected > 0;
  }

  @override
  Future<List<Product?>> getDeadStockProducts() async {
    final Database database = await _databaseHelper.database;
    List<Map<String, dynamic>> maps = await database.rawQuery(
      "SELECT p.* FROM products p "
      "WHERE p.id NOT IN ("
      "SELECT p2.id FROM products p2"
      "JOIN invoice_products ip ON p2.id = ip.product_id "
      "JOIN invoices i ON ip.invoice_id = i.id "
      "WHERE date(i.invoice_date) >= date('now', - || p2.deadStockThreshold || days) "
      ")",
    );
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  @override
  Future<List<Product?>> getFastMovingProducts() async {
    final Database database = await _databaseHelper.database;
    List<Map<String, dynamic>> maps = await database.rawQuery(
      "SELECT products.* FROM products "
      "JOIN invoice_products ON products.id = invoice_product.product_id "
      "JOIN invoices ON invoice_products.invoice_id = invoices.id "
      "WHERE date(invoices.invoice_date) BETWEEN date('now', '-14 days') AND date('now', '0 days') "
      "GROUP BY products.id "
      "HAVING count(invoices.*) >= products.fast_moving_threshold "
      "ORDER BY count(invoices.*) DESC",
    );
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  @override
  Future<List<Product?>> getLowStockProducts() async {
    final Database database = await _databaseHelper.database;
    var res = await database.query(
      ProductsTable.PRODUCTS_TABLE_NAME,
      where: '${ProductsTable.PRODUCTS_QUANTITY} <= ${ProductsTable.PRODUCTS_CRITICAL_LEVEL}',
    );
    return res.map(Product.fromMap).toList();
  }
}
