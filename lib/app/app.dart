import 'package:easthardware_pms/app/dependency_injector.dart';
import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  // Singleton
  App._internal();
  static final App instance = App._internal();
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
    final lightTheme = FluentThemeData(
      scaffoldBackgroundColor: Colors.grey[10],
      brightness: Brightness.light,
      accentColor: Colors.blue,
      // Add other theme properties as needed
    );

    return MultiProvider(
      providers: di.inject(),
      child: FluentApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: lightTheme,
      ),
    );
  }
}
