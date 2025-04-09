import 'package:easthardware_pms/app/dependency_injector.dart';
import 'package:easthardware_pms/domain/enums/enums.dart' show AccessLevel;
import 'package:easthardware_pms/presentation/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  // Singleton
  const App._internal();
  static const App instance = App._internal();
  factory App() => instance;
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  late DependencyInjector di;
  @override
  void initState() {
    super.initState();
    di = DependencyInjector();
    di.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: di.inject(),
      child: Builder(builder: (context) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: context.read<AuthenticationBloc>(),
          listener: (context, state) {
            if (state.status == AuthenticationStatus.success) {
              AccessLevel level = state.user!.accessLevel;
              redirectToDashboard(context, level);
            }

            if (state.status == AuthenticationStatus.failure && state.loginAttempts > 3) {
              redirectToPasswordReset(context);
            }
          },
          child: FluentApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            themeMode: ThemeMode.light,
            color: Colors.grey[170],
          ),
        );
      }),
    );
  }
}

void redirectToDashboard(BuildContext context, AccessLevel level) {
  if (context.mounted) {
    switch (level) {
      case AccessLevel.administrator:
        router.goNamed("Admin");
        break;
      case AccessLevel.staff:
        router.goNamed("Staff");
        break;
    }
  }
}

void redirectToPasswordReset(BuildContext context) {
  if (context.mounted) {
    router.goNamed("ResetPassword");
  }
}
