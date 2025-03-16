import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:easthardware_pms/presentation/widgets/authentication/login_button_row.dart';
import 'package:easthardware_pms/presentation/widgets/brand/logo_row.dart';
import 'package:easthardware_pms/presentation/widgets/authentication/page_title.dart';
import 'package:easthardware_pms/presentation/widgets/authentication/password_form_row.dart';
import 'package:easthardware_pms/presentation/widgets/authentication/username_form_row.dart';

import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleButtonPress(BuildContext context) {
    primaryFocus?.unfocus();
    context.read<AuthenticationBloc>().add(AuthenticationLoginEvent(
          username: _usernameController.text.trim(),
          password: _usernameController.text.trim(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    const String title = "Login";
    const String subtitle = "Fill in the form below to log in";

    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state is AuthenticationLoginSuccessState) redirectToDashboard(state.user.accessLevel);
          if (state.loginCount == 2) redirectToPasswordReset();
        },
        child: ScaffoldPage.withPadding(
          padding: AppPadding.v32h64,
          content: Column(
            children: [
              const LogoRow(),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 400,
                    width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const PageTitle(title: title, subtitle: subtitle),
                        UsernameFormRow(controller: _usernameController),
                        PasswordFormRow(controller: _passwordController),
                        LoginButtonRow(onPressed: () => _handleButtonPress(context))
                      ].withGap(() => Gaps.v16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

void redirectToDashboard(AccessLevel accessLevel) {
  switch (accessLevel) {
    case AccessLevel.administrator:
      router.goNamed("Admin Dashboard");
      break;
    case AccessLevel.staff:
      router.goNamed("Staff Dashboard");
      break;
    default:
  }
}

// TODO: Implement Password Reset
void redirectToPasswordReset() {}
