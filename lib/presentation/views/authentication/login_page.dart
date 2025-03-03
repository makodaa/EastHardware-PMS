import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/repository/authentication_repository.dart';

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
      create: (context) => LoginFormBloc(context.read<AuthenticationRepository>()),
      child: Builder(builder: (context) {
        var bloc = context.read<LoginFormBloc>();

        return BlocListener<LoginFormBloc, LoginFormState>(
          bloc: bloc,
          listener: (context, state) {},
          child: ScaffoldPage.withPadding(
            padding: const EdgeInsets.all(16),
            content: const Center(
              child: Card(
                child: SizedBox(
                  height: 400,
                  width: 600,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PageTitle(title: title, subtitle: subtitle),
                        Gaps.v16,
                        UsernameField(),
                        Gaps.v16,
                        PasswordField(),
                        Gaps.v16,
                        LoginButtonContainer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    this.placeholder,
    super.key,
  });

  final String? placeholder;

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
          onChanged: (value) {
            context.read<LoginFormBloc>().add(LoginFormEvent.usernameChanged(value));
          },
        ),
      ],
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    this.placeholder,
    super.key,
  });

  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text("Username"),
      Gaps.v8,
      TextBox(
        placeholder: placeholder,
        onChanged: (text) {
          context.read<LoginFormBloc>().add(LoginFormEvent.usernameChanged(text));
        },
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

class LoginButtonContainer extends StatelessWidget {
  const LoginButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onPressed: () {
            context.read<LoginFormBloc>().add(const LoginFormEvent.loginButtonPressed());
          },
        ),
      ],
    );
  }
}
