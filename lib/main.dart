import 'package:easthardware_pms/presentation/views/authentication/login_page.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main() => runApp(const TestApp());

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
      home: const LoginPage(),
    );
  }
}
