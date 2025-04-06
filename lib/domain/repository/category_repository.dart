import 'package:easthardware_pms/domain/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>?> getAllCategories();
  Future<Category?> getCategoryById(int id);

  Future<Category> insertCategory(Category category);
  Future<Category> updateCategory(Category category);
  Future<void> deleteCategory(int id);
}
