import 'package:easthardware_pms/data/database/dao/products_dao.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/product.dart';
import 'package:easthardware_pms/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl() : super();
  final ProductsDaoImpl _productsDao = ProductsDaoImpl();
  @override
  Future<void> deleteProduct(int id) {
    try {
      return _productsDao.deleteProduct(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<Product?>> getAllProducts() {
    try {
      return _productsDao.getAllProducts();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Product?> getProductById(int id) {
    try {
      return _productsDao.getProductById(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Product> insertProduct(Product product) {
    try {
      return _productsDao.insertProduct(product);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Product> updateProduct(Product product) {
    try {
      return _productsDao.updateProduct(product);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
