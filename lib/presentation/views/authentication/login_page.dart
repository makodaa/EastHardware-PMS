import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/views/authentication/login_form.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(builder: (context) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: context.read<AuthenticationBloc>(),
          listener: (_, state) {
            final authState = context.read<AuthenticationBloc>().state;
            final status = authState.status;
            final user = authState.user;

            if (status == AuthenticationStatus.failure && authState.loginAttempts > 3) {
              context.go(AppRoutes.resetPassword);
            }

            if (status == AuthenticationStatus.success) {
              if (user?.accessLevel == AccessLevel.administrator) {
                context.read<NavigationBloc>().add(const NavigationIndexChanged(index: 0));
                context.go(AppRoutes.admin);
              } else if (user?.accessLevel == AccessLevel.staff) {
                context.go(AppRoutes.admin);
              }
            }
            context.read<LoginFormBloc>().add(LoginFormReturned());
          },
          child: ColoredBox(
            color: Colors.grey[10],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Expanded(child: LoginForm()),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
