import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:easthardware_pms/presentation/views/inventory/create_product_page.dart';
import 'package:easthardware_pms/presentation/views/inventory/inventory_pane_page.dart';
import 'package:easthardware_pms/presentation/views/navigation/admin_navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: "Login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.resetPassword,
      name: "ResetPassword",
      builder: (context, state) => const Text("Reset Password"),
    ),
    StatefulShellRoute(
      builder: (context, state, shell) => shell,
      navigatorContainerBuilder: (_, shell, children) =>
          AdminNavigationScaffold(shell, children),
      branches: [
        StatefulShellBranch(
          initialLocation: AppRoutes.adminDashboard,
          routes: [
            GoRoute(
              name: "Admin",
              path: AppRoutes.adminDashboard,
              builder: (context, state) => const Text("dashboard"),
            )
          ],
        ),
        StatefulShellBranch(
          initialLocation: AppRoutes.inventoryPage,
          routes: [
            GoRoute(
              name: "Inventory",
              path: AppRoutes.inventoryPage,
              builder: (context, state) => const InventoryPanePage(),
            ),
            GoRoute(
              name: "CreateProduct",
              path: AppRoutes.createProductPage,

              /// The [MaterialPage] is used for the transition animation.
              /// Should be removed if decided not to use the transition.
              pageBuilder: (context, state) => const MaterialPage(
                child: CreateProductPage(),
              ),
            ),
          ],
        )
      ],
      // path: AppRoutes.adminScaffold,
      // name: "Admin",
      // builder: (context, state) => const AdminNavigationScaffold(),
    )
    // ShellRoute(
    //   routes: [
    //     GoRoute(
    //       path: AppRoutes.adminDashboard,

    //     )
    //   ],
    // ),
  ],
);
