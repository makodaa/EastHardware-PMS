import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/widgets/authentication/login_form.dart';

import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (_, state) {
        if (state.status == AuthenticationStatus.success) {
          final AccessLevel level = state.user!.accessLevel;
          redirectToDashboard(context, level);
        }
      },
      child: ColoredBox(
        color: Colors.grey[10],
        child: const Center(
          child: LoginPageCard(
            children: [
              LoginForm(),
            ],
          ),
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
          children: children!.withGap(() => Gaps.v16),
        ),
      ),
    );
  }
}

void redirectToDashboard(BuildContext context, AccessLevel level) {
  if (context.mounted) {
    switch (level) {
      case AccessLevel.administrator:
        context.goNamed("Admin");
        break;
      case AccessLevel.staff:
        context.goNamed("Staff");
        break;
      default:
    }
  }
}

void redirectToPasswordReset() {}
