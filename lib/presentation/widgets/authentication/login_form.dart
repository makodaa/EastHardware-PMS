import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_bloc.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/authentication/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/icons/app.png", height: 24.0),
          _FormHeader(),
          _FormUsernameField(),
          _FormPasswordField(),
          Gaps.v8,
          _FormButton(),
        ].withGap(() => Gaps.v16),
      ),
    );
  }
}

class _FormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Login",
            style: FluentTheme.of(context).typography.title,
            textAlign: TextAlign.start,
          ),
          Text(
            "Fill in the form below to log in",
            style: FluentTheme.of(context).typography.body?.copyWith(color: Colors.grey[170]),
            textAlign: TextAlign.start,
          )
        ].withGap(() => Gaps.v8));
  }
}

class _FormUsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Username",
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
          TextBox(
            onChanged: (value) =>
                context.read<LoginFormBloc>().add(LoginFormUsernameChanged(value)),
          )
        ].withGap(() => Gaps.v8));
  }
}

class _FormPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Password",
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
        PasswordBox(
          revealMode: PasswordRevealMode.peek,
          onChanged: (value) => context.read<LoginFormBloc>().add(LoginFormPasswordChanged(value)),
        ),
      ].withGap(() => Gaps.v8),
    );
  }
}

class _FormButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        if (state.isSubmitting == true) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationLoginEvent(username: state.username, password: state.password));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed:
                context.read<AuthenticationBloc>().state.status != AuthenticationStatus.loading
                    ? () => context.read<LoginFormBloc>().add(LoginFormButtonPressed())
                    : null,
            child: Padding(
              padding: AppPadding.a8,
              child: Text(
                "Login",
                style: FluentTheme.of(context).typography.bodyStrong!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
