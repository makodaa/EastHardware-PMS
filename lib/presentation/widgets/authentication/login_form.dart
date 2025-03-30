import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_validator.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/authentication/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = context.read<LoginFormBloc>().formKey;
    return Padding(
      padding: AppPadding.a16,
      child: Form(
        key: formKey,
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
            style: FluentTheme.of(context)
                .typography
                .body
                ?.copyWith(color: Colors.grey[170]),
            textAlign: TextAlign.start,
          )
        ].withGap(() => Gaps.v8));
  }
}

class _FormUsernameField extends StatelessWidget with LoginFormValidator {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Username",
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
        TextFormBox(
          validator: validateUsername,
          onChanged: (value) => context
              .read<LoginFormBloc>()
              .add(LoginFormUsernameChanged(value)),
        )
      ].withGap(() => Gaps.v8),
    );
  }
}

class _FormPasswordField extends StatelessWidget with LoginFormValidator {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Password",
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
        PasswordFormBox(
          validator: validatePassword,
          revealMode: PasswordRevealMode.peekAlways,
          onSaved: (value) => switch (value) {
            String value => context
                .read<LoginFormBloc>()
                .add(LoginFormPasswordChanged(value)),
            null => null,
          },
        ),
      ].withGap(() => Gaps.v8),
    );
  }
}

class _FormButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginFormBloc = context.read<LoginFormBloc>();
    var authenticationBloc = context.read<AuthenticationBloc>();

    return BlocListener<LoginFormBloc, LoginFormState>(
      bloc: loginFormBloc,
      listener: (context, state) {
        if (state.isSubmitting == true) {
          var event = AuthenticationLoginEvent(
            username: state.username,
            password: state.password,
          );

          authenticationBloc.add(event);
        }
      },
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state.status == AuthenticationStatus.success) {
            loginFormBloc.add(LoginFormReset());
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: state.status != AuthenticationStatus.loading
                    ? () => loginFormBloc.add(LoginFormButtonPressed())
                    : null,
                child: Padding(
                  padding: AppPadding.a8,
                  child: Text(
                    "Login",
                    style: FluentTheme.of(context)
                        .typography
                        .bodyStrong!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
