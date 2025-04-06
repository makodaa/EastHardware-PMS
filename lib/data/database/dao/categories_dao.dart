import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/category.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// DAO: Data Access Objects
// This file contains the interface and implementation for accessing
// their respective table in the database.
// The interface defines the methods for CRUD operations.
// The implementation uses the DatabaseHelper to get the database instance.
// The implementation class is responsible for executing the SQL queries
// and returning the results.

abstract class CategoriesDao {
  Future<List<Category>?> getAllCategories();
  Future<Category?> getCategoryById(int id);
  Future<bool> insertCategory(Category category);
  Future<bool> updateCategory(Category category);
  Future<bool> deleteCategory(int id);
}

/// Implementation of the CategoriesDao interface
/// This class handles the database operations for categories.
/// It uses the DatabaseHelper to get the database instance.
/// It provides methods to get all categories, get a category by id,
/// insert a new category, update an existing category, and delete a category.
/// It returns a Future<bool> indicating the success of the operation.
/// It returns a Future<List<Category>?> for getting all categories or a specific category.
/// It returns null if no categories are found or if the category is not found.

class CategoriesDaoImpl extends CategoriesDao {
  final DatabaseHelper _databaseHelper;

  CategoriesDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  /// Deletes a category by its ID.
  @override
  Future<bool> deleteCategory(int id) async {
    final db = await _databaseHelper.database;
    int res = await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    return res != 0;
  }

  /// Gets all categories from the database.
  @override
  Future<List<Category>?> getAllCategories() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.isNotEmpty ? maps.map((map) => Category.fromMap(map)).toList() : null;
  }

  /// Gets a category by its ID.
  @override
  Future<Category?> getCategoryById(int id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty ? Category.fromMap(maps.first) : null;
  }

  /// Inserts a new category into the database.
  @override
  Future<bool> insertCategory(Category category) async {
    final db = await _databaseHelper.database;
    int res = await db.insert(
      'categories',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
    return res != 0;
  }

  /// Updates an existing category in the database.
  @override
  Future<bool> updateCategory(Category category) async {
    final db = await _databaseHelper.database;
    int res = await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
    return res != 0;
  }
}
