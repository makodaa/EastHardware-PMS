import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/category.dart';

abstract class CategoriesDao {
  Future<List<Category>?> getAllCategories();
  Future<Category?> getCategoryById(int id);

  Future<bool> insertCategory(Category category);
  Future<bool> updateCategory(Category category);
  Future<bool> deleteCategory(int id);
}

class CategoriesDaoImpl extends CategoriesDao {
  final DatabaseHelper _databaseHelper;

  CategoriesDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

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

  @override
  Future<List<Category>?> getAllCategories() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.isNotEmpty ? maps.map((map) => Category.fromMap(map)).toList() : null;
  }

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
  Future<bool> insertCategory(Category category) async {
    final db = await _databaseHelper.database;
    int res = await db.insert('categories', category.toMap());
    return res != 0;
  }

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
