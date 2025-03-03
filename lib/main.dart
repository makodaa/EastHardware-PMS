import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

void main() {
  var repository = AuthenticationRepositoryImpl();

  runApp(
    Provider.value(
      value: repository,
      child: const TestApp(),
    ),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "Silangan: Product Management System",
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        scaffoldBackgroundColor: const Color(0xFFf9f9f9),
        accentColor: Colors.blue,
        brightness: Brightness.light,
      ),
    );
  }
}
