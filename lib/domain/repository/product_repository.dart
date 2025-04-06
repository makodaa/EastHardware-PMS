import 'package:easthardware_pms/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product?>> getAllProducts();
  Future<Product?> getProductById(int id);

  Future<Product> insertProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}
