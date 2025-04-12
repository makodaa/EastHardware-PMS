import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_validator.dart';
import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/authentication/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Padding(
        padding: AppPadding.a16,
        child: Builder(builder: (context) {
          var formKey = context.read<LoginFormBloc>().formKey;
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/icons/app.png", height: 24.0),
                _FormHeader(),
                _FormUsernameField(),
                _FormPasswordField(),
                Spacing.v8,
                _FormButton(),
              ].withSpacing(() => Spacing.v16),
            ),
          );
        }),
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
        ].withSpacing(() => Spacing.v8));
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
          onChanged: (value) => context.read<LoginFormBloc>().add(LoginFormUsernameChanged(value)),
        )
      ].withSpacing(() => Spacing.v8),
    );
  }
}

class _FormPasswordField extends StatelessWidget with LoginFormValidator {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const BodyText('Password'),
        TextFormBox(
          obscureText: true,
          validator: validatePassword,
          onChanged: (value) => context.read<LoginFormBloc>().add(LoginFormPasswordChanged(value)),
        ),
      ].withSpacing(() => Spacing.v8),
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
          print('primitive ahh: ${state.username} ${state.password}');
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
            loginFormBloc.add(LoginFormResetEvent());
          }
        },
        builder: (context, state) {
          return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            FilledButton(
              onPressed: state.status != AuthenticationStatus.loading
                  ? () => loginFormBloc.add(LoginFormButtonPressed())
                  : null,
              child: const Padding(
                padding: AppPadding.a8,
                child: ButtonText("Login"),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
