import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/product_repository.dart';
import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/domain/models/product.dart';
import 'package:equatable/equatable.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this._repository) : super(ProductsStateInitial()) {
    on<LoadAllProductsEvent>(_onLoad);
    on<ReloadAllProductsEvent>(_onReloadAllProducts);
    on<AddProductEvent>(_onAdd);
    on<UpdateProductEvent>(_onUpdate);
    on<DeleteProductEvent>(_onDelete);
  }
  final ProductRepositoryImpl _repository;

  void _onLoad(LoadAllProductsEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      emit(state.copyWith(
          allProducts: await _repository.getAllProducts(),
          lowStockProducts: await _repository.getLowStockProducts(),
          fastMovingProducts: await _repository.getFastMovingProducts(),
          deadStockProducts: await _repository.getDeadStockProducts(),
          status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onReloadAllProducts(ReloadAllProductsEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      emit(state.copyWith(
          allProducts: await _repository.getAllProducts(),
          lowStockProducts: await _repository.getLowStockProducts(),
          fastMovingProducts: await _repository.getFastMovingProducts(),
          deadStockProducts: await _repository.getDeadStockProducts(),
          status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onAdd(AddProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.insertProduct(event.product);

      final products = state.allProducts;
      final lowStockProducts = state.lowStockProducts;
      products.add(event.product);

      if (event.product.quantity <= event.product.criticalLevel) {
        lowStockProducts.add(event.product);
      }
      emit(state.copyWith(
        allProducts: products,
        lowStockProducts: lowStockProducts,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onUpdate(UpdateProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.insertProduct(event.product);

      final products = state.allProducts;
      final lowStockProducts = state.lowStockProducts;
      products.add(event.product);

      final index = products.indexWhere((product) => product.id == event.product.id);
      final isInitiallyLowStock = products[index].quantity <= products[index].quantity;
      final isNowLowStock = event.product.quantity <= event.product.criticalLevel;

      if (isInitiallyLowStock && isNowLowStock) {
        lowStockProducts.add(event.product);
      }

      emit(state.copyWith(
        allProducts: products,
        lowStockProducts: lowStockProducts,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onDelete(DeleteProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.deleteProduct(event.productId);
      emit(state.copyWith(
          allProducts: await _repository.getAllProducts(),
          lowStockProducts: await _repository.getLowStockProducts(),
          fastMovingProducts: await _repository.getFastMovingProducts(),
          deadStockProducts: await _repository.getDeadStockProducts(),
          status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }
}
