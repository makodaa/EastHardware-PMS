import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:easthardware_pms/presentation/views/inventory/inventory_pane_page.dart';
import 'package:easthardware_pms/presentation/views/navigation/admin_navigation_scaffold.dart';
import 'package:fluent_ui/fluent_ui.dart';
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
    StatefulShellRoute(
      builder: (context, state, shell) => shell,
      navigatorContainerBuilder: (_, shell, children) => AdminNavigationScaffold(shell, children),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "Admin",
              path: "/dashboard",
              builder: (context, state) => Text("dashboard"),
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "Inventory",
              path: "/inventory",
              builder: (context, state) => const InventoryPanePage(),
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
