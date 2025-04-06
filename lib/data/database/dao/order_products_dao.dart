import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/order_product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class OrderProductsDao {
  Future<List<OrderProduct?>> getAllOrderProducts();
  Future<OrderProduct?> getOrderProductById(int id);
  Future<void> insertOrderProduct(OrderProduct orderProduct);
  Future<void> updateOrderProduct(OrderProduct orderProduct);
  Future<void> deleteOrderProduct(int id);
  Future<List<OrderProduct?>> getOrderProductsByOrderId(int orderId);
}

class OrderProductsDaoImpl extends OrderProductsDao {
  final DatabaseHelper _databaseHelper;
  OrderProductsDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  /// Returns a list of all order products in the database.
  ///
  @override
  Future<List<OrderProduct?>> getAllOrderProducts() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('order_products');
    return List.generate(maps.length, (i) {
      return OrderProduct.fromMap(maps[i]);
    });
  }

  /// Returns an order product by its ID.
  /// If no order product is found, returns null.
  ///
  @override
  Future<OrderProduct?> getOrderProductById(int id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'order_products',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return OrderProduct.fromMap(maps.first);
    }
    return null;
  }

  /// Inserts a new order product into the database.
  @override
  Future<void> insertOrderProduct(OrderProduct orderProduct) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'order_products',
      orderProduct.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  /// Updates an existing order product in the database.
  ///
  @override
  Future<void> updateOrderProduct(OrderProduct orderProduct) async {
    final db = await _databaseHelper.database;
    await db.update(
      'order_products',
      orderProduct.toMap(),
      where: 'id = ?',
      whereArgs: [orderProduct.id],
    );
  }

  /// Deletes an order product from the database by its ID.
  @override
  Future<void> deleteOrderProduct(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'order_products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Returns a list of order products by their order ID.
  @override
  Future<List<OrderProduct?>> getOrderProductsByOrderId(int orderId) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'order_products',
      where: 'order_id = ?',
      whereArgs: [orderId],
    );
    return List.generate(maps.length, (i) {
      return OrderProduct.fromMap(maps[i]);
    });
  }
}
