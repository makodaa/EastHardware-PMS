import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/data/repository/category_repository.dart';
import 'package:easthardware_pms/data/repository/product_repository.dart';
import 'package:easthardware_pms/data/repository/unit_repository.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/inventory/categorylist/category_list_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/inventory/productlist/product_list_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/inventory/unitlist/unit_list_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class DependencyInjector {
  late AuthenticationRepositoryImpl _authenticationRepository;
  late ProductRepositoryImpl _productRepository;
  late CategoryRepositoryImpl _categoryRepository;
  late UnitRepositoryImpl _unitRepository;

  Future<void> init() async {
    _authenticationRepository = AuthenticationRepositoryImpl();
    _productRepository = ProductRepositoryImpl();
    _categoryRepository = CategoryRepositoryImpl();
    _unitRepository = UnitRepositoryImpl();
  }

  List<SingleChildWidget> inject() {
    return [
      BlocProvider(create: (context) => AuthenticationBloc(_authenticationRepository)),
      BlocProvider(create: (context) => NavigationBloc()),
      BlocProvider(create: (context) => ProductListBloc(_productRepository)),
      BlocProvider(create: (context) => CategoryListBloc(_categoryRepository)),
      BlocProvider(create: (context) => UnitListBloc(_unitRepository)),
    ];
  }
}
