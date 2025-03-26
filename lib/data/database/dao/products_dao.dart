import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/data/database/tables/products_table.dart';
import 'package:easthardware_pms/domain/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class ProductsDao {
  Future<List<Product>?> getAllProducts();
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
  Future<List<Product>?> getAllProducts() async {
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
    int id = await database.insert(ProductsTable.PRODUCTS_TABLE_NAME, product.toMap());

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
}
