import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_router.dart';

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
    const String title = "Welcome!";
    const String subtitle = "Enter your credentials to log into your account.";

    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state is AuthenticationLoginSuccessState) {
            switch (state.user.accessLevel) {
              case AccessLevel.administrator:
                router.goNamed("Admin Dashboard");
                break;
              case AccessLevel.staff:
                router.goNamed("Staff Dashboard");
                break;
              default:
            }
          }
        },
        child: ScaffoldPage.withPadding(
          padding: const EdgeInsets.all(16),
          content: Center(
            child: SizedBox(
              height: 400,
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PageTitle(title: title, subtitle: subtitle),
                  UsernameFormRow(controller: _usernameController),
                  PasswordFormRow(controller: _passwordController),
                  LoginButtonRow(onPressed: () => _handleButtonPress(context))
                ].withGap(() => Gaps.v16),
              ),
            ),
          ),
        ));
  }
}

class PasswordFormRow extends StatelessWidget {
  const PasswordFormRow({
    required this.controller,
    this.placeholder,
    super.key,
  });

  final String? placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Password",
        ),
        Gaps.v8,
        PasswordBox(
          placeholder: placeholder,
          revealMode: PasswordRevealMode.peek,
          controller: controller,
        ),
      ],
    );
  }
}

class UsernameFormRow extends StatelessWidget {
  const UsernameFormRow({
    required this.controller,
    this.placeholder,
    super.key,
  });

  final String? placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text("Username"),
      Gaps.v8,
      TextBox(
        placeholder: placeholder,
      )
    ]);
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: FluentTheme.of(context).typography.titleLarge,
        ),
        Gaps.v8,
        Text(
          subtitle,
          style: FluentTheme.of(context).typography.caption?.copyWith(color: Colors.grey[170]),
        )
      ],
    );
  }
}

class LoginButtonRow extends StatelessWidget {
  const LoginButtonRow({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              "Login",
              style: FluentTheme.of(context)
                  .typography
                  .bodyLarge!
                  .copyWith(color: const Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }
}

extension GapList on List<Widget> {
  List<Widget> withGap(Widget Function() gapWidget) => [
        for (var (index, widget) in indexed) ...[
          widget,
          if (index < length - 1) gapWidget(),
        ]
      ];
}
