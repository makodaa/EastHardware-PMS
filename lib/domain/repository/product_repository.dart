import 'package:easthardware_pms/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProducts();
  Future<Product?> getProductById(int id);

  Future<bool> insertProduct(Product product);
  Future<bool> updateProduct(Product product);
  Future<bool> deleteProduct(int id);
}
