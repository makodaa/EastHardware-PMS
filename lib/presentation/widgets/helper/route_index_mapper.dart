import 'package:easthardware_pms/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_routes.dart';

class RouteIndexMapper {
  static String? getRouteFromIndex(NavigationState state) {
    return switch (state.selectedIndex) {
      0 => AppRoutes.admin,
      1 => AppRoutes.inventoryPage,
      2 => AppRoutes.inventoryPage,
      3 => AppRoutes.createProductPage,
      4 => AppRoutes.categoriesPage,
      _ => null,
    };
  }

  static int? getIndexFromRoute(String route) {
    return switch (route) {
      AppRoutes.admin => 0,
      AppRoutes.inventoryPage => 2,
      AppRoutes.createProductPage => 3,
      AppRoutes.categoriesPage => 4,
      _ => null
    };
  }
}
