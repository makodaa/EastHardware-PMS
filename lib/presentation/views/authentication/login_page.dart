import 'package:easthardware_pms/presentation/bloc/authentication/authentication_bloc.dart';

import 'package:easthardware_pms/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // void _login(BuildContext context) {
  //   primaryFocus?.unfocus();
  //   final form_data = context.read<LoginFormBloc>().state;

  //   context.read<AuthenticationBloc>().add(AuthenticationLoginEvent(
  //         form_data.username.trim(),
  //         form_data.password.trim(),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    const String title = "Welcome!";
    const String subtitle = "Enter your credentials to log into your account.";

    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: ScaffoldPage.withPadding(
        padding: const EdgeInsets.all(16),
        content: Center(
          child: Card(
            child: SizedBox(
              height: 400,
              width: 600,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageTitle(context: context, title: title, subtitle: subtitle),
                    Gaps.v16,
                    UsernameField(context: context),
                    Gaps.v16,
                    PasswordField(context: context),
                    Gaps.v16,
                    LoginButtonContainer(context: context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget PageTitle({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: FluentTheme.of(context).typography.titleLarge,
          ),
          Gaps.v8,
          Text(
            subtitle,
            style: FluentTheme.of(context).typography.caption?.copyWith(
                  color: Colors.grey[170],
                ),
          )
        ],
      );

  Widget UsernameField({
    required BuildContext context,
    String? placeholder,
  }) =>
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text(
          "Username",
        ),
        Gaps.v8,
        TextBox(placeholder: placeholder)
      ]);

  Widget PasswordField({
    required BuildContext context,
    String? placeholder,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Password",
          ),
          Gaps.v8,
          PasswordBox(
            placeholder: placeholder,
            revealMode: PasswordRevealMode.peek,
          ),
        ],
      );

  Widget LoginButtonContainer({
    required BuildContext context,
    Function? onPressed,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
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
            onPressed: () {},
          ),
        ],
      );
}
