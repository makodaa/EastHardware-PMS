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
      throw DatabaseException("Failed to delete product: $e");
    }
  }

  @override
  Future<List<Product?>> getAllProducts() async {
    try {
      return await _productsDao.getAllProducts();
    } catch (e) {
      throw DatabaseException("Failed to fetch products: $e");
    }
  }

  @override
  Future<Product?> getProductById(int id) async {
    try {
      return await _productsDao.getProductById(id);
    } catch (e) {
      throw DatabaseException("Failed to fetch product: $e");
    }
  }

  @override
  Future<Product> insertProduct(Product product) async {
    _validateProduct(product);
    final existingProduct = await _productsDao.getProductById(product.id);
    if (existingProduct != null) {
      throw DatabaseException('Product with ID ${product.id} already exists');
    }
    try {
      return _productsDao.insertProduct(product);
    } catch (e) {
      throw DatabaseException("Failed to insert product: $e");
    }
  }

  @override
  Future<Product> updateProduct(Product product) {
    // Validate the product before updating
    _validateProduct(product);
    try {
      return _productsDao.updateProduct(product);
    } catch (e) {
      throw DatabaseException("Failed to update product: $e");
    }
  }

  @override
  Future<List<Product?>> getDeadStockProducts() {
    try {
      return _productsDao.getDeadStockProducts();
    } catch (e) {
      throw DatabaseException("Failed to fetch dead stock products: $e");
    }
  }

  @override
  Future<List<Product?>> getFastMovingProducts() {
    try {
      return _productsDao.getFastMovingProducts();
    } catch (e) {
      throw DatabaseException("Failed to fetch fast moving products: $e");
    }
  }

  @override
  Future<List<Product?>> getLowStockProducts() {
    try {
      return _productsDao.getLowStockProducts();
    } catch (e) {
      throw DatabaseException("Failed to fetch low stock products: $e");
    }
  }

  @override
  Future<List<Product?>> getProductsByCategoryId(int categoryId) {
    try {
      return _productsDao.getProductsByCategoryId(categoryId);
    } catch (e) {
      throw DatabaseException("Failed to fetch products by category ID: $e");
    }
  }

  void _validateProduct(Product product) {
    if (product.id <= 0) {
      throw ArgumentException('Invalid product ID');
    }
    if (product.name.isEmpty) {
      throw ValidationException('Product name cannot be empty');
    }
    if (product.salePrice <= 0) {
      throw ValidationException('Product price must be greater than zero');
    }
  }
}
