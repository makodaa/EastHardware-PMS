import 'package:easthardware_pms/app/dependency_injector.dart';
import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:fluent_ui/fluent_ui.dart';
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
          return FluentApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            themeMode: ThemeMode.light,
            color: Colors.grey[170],
          );
        }));
  }
}
