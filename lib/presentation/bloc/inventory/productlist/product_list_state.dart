part of 'product_list_bloc.dart';

class ProductListState {
  final List<Product> allProducts;
  final List<Product> lowStockProducts;
  final List<Product> deadStockProducts;
  final List<Product> fastMovingProducts;
  final DataStatus status;

  ProductListState({
    required this.allProducts,
    required this.lowStockProducts,
    required this.deadStockProducts,
    required this.fastMovingProducts,
    this.status = DataStatus.initial,
  });

  ProductListState copyWith({
    List<Product>? allProducts,
    List<Product>? lowStockProducts,
    List<Product>? deadStockProducts,
    List<Product>? fastMovingProducts,
    DataStatus? status,
  }) {
    return ProductListState(
      allProducts: allProducts ?? this.allProducts,
      lowStockProducts: lowStockProducts ?? this.lowStockProducts,
      deadStockProducts: deadStockProducts ?? this.deadStockProducts,
      fastMovingProducts: fastMovingProducts ?? this.fastMovingProducts,
      status: status ?? this.status,
    );
  }
}

class ProductsStateInitial extends ProductListState {
  ProductsStateInitial()
      : super(
          allProducts: [],
          lowStockProducts: [],
          deadStockProducts: [],
          fastMovingProducts: [],
        );
}
