import 'package:easthardware_pms/presentation/widgets/authentication/login_form.dart';

import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey[10],
      child: const Center(
        child: LoginPageCard(
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginPageCard extends StatelessWidget {
  const LoginPageCard({super.key, this.children});
  final List<Widget>? children;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 400,
          maxWidth: 500,
        ),
        child: Column(
          children: children!.withSpacing(() => Spacing.v16),
        ),
      ),
    );
  }
}
