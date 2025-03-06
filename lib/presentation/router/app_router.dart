import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:easthardware_pms/presentation/views/dashboard/admin_dashboard_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: "Login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.admin_dashboard,
      name: "Admin Dashboard",
      builder: (context, state) => const AdminDashboardPage(),
    ),
    GoRoute(
      path: AppRoutes.staff_dashboard,
      name: "Staff Dashboard",
      redirect: (context, state) => AppRoutes.login,
    ),
  ],
);
