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
  CategoriesDao._();
  factory CategoriesDao([DatabaseHelper? databaseHelper]) {
    return CategoriesDaoImpl._(databaseHelper);
  }

  Future<List<Category>> getAllCategories();
  Future<Category?> getCategoryById(int id);
  Future<Category> insertCategory(Category category);
  Future<Category> updateCategory(Category category);
  Future<void> deleteCategory(int id);
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

  CategoriesDaoImpl._([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper(),
        super._();

  /// Gets all categories from the database.
  @override
  Future<List<Category>> getAllCategories() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.isNotEmpty ? maps.map((map) => Category.fromMap(map)).toList() : [];
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

  @override
  Future<void> deleteCategory(int id) async {
    final db = await _databaseHelper.database;
    final category = await getCategoryById(id);
    if (category == null) {
      throw Exception('Category not found');
    }
    await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<Category> insertCategory(Category category) async {
    final db = await _databaseHelper.database;
    final id = await db.insert(
      'categories',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
    return category.copyWith(id: id);
  }

  @override
  Future<Category> updateCategory(Category category) async {
    final db = await _databaseHelper.database;
    await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
    return category;
  }
}
