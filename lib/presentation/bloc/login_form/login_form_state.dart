part of 'login_form_bloc.dart';

sealed class LoginFormState extends Equatable {
  final String username;
  final String password;
  final bool is_valid;

  const LoginFormState({required this.username, required this.password, required this.is_valid});

  @override
  List<Object?> get props => [username, password];
}

class LoginFormInitial extends LoginFormState {
  const LoginFormInitial()
      : super(
          username: '',
          password: '',
          is_valid: false,
        );
}

class LoginFormFilled extends LoginFormState {
  final String input_username;
  final String input_password;
  final bool input_is_valid;
  const LoginFormFilled({
    required this.input_username,
    required this.input_password,
    required this.input_is_valid,
  }) : super(
          username: input_username,
          password: input_password,
          is_valid: input_is_valid,
        );
  @override
  List<Object?> get props => [input_username, input_password];
}
