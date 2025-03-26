import 'package:easthardware_pms/domain/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>?> getAllCategories();
  Future<Category?> getCategoryById(int id);

  Future<bool> insertCategory(Category category);
  Future<bool> updateCategory(Category category);
  Future<bool> deleteCategory(int id);
}
