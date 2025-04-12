import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:easthardware_pms/presentation/views/inventory/create_product_page.dart';
import 'package:easthardware_pms/presentation/views/inventory/inventory_pane_page.dart';
import 'package:easthardware_pms/presentation/views/navigation/admin_navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.resetPassword,
      builder: (context, state) => const Text("Reset Password"),
    ),
    StatefulShellRoute(
      builder: (context, state, shell) => shell,
      navigatorContainerBuilder: (context, shell, children) =>
          AdminNavigationScaffold(shell, children),
      branches: [
        // Admin Dashboard Shell
        StatefulShellBranch(
          initialLocation: AppRoutes.admin,
          routes: [
            GoRoute(
              path: AppRoutes.admin,
              builder: (context, state) => const Text("Dashboard"),
            )
          ],
        ),

        // Inventory Page Shell
        StatefulShellBranch(
          initialLocation: AppRoutes.inventoryPage,
          routes: [
            GoRoute(
                path: AppRoutes.inventoryPage,
                builder: (context, state) => const InventoryPanePage()),
            GoRoute(
              path: AppRoutes.createProductPage,

              /// The [MaterialPage] is used for the transition animation.
              /// Should be removed if decided not to use the transition.
              pageBuilder: (context, state) => const MaterialPage(
                child: CreateProductPage(),
              ),
            ),
            GoRoute(
              path: AppRoutes.categoriesPage,
              builder: (context, state) => const Center(child: Text('Manage Categories')),
            ),
          ],
        ),
      ],
    )
  ],
);
