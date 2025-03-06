part of 'login_form_bloc.dart';

// use mixins lang for this.
sealed class LoginFormState with EquatableMixin {
  final String username;
  final String password;
  final bool isValid;

  const LoginFormState({required this.username, required this.password, required this.isValid});

  @override
  List<Object?> get props => [username, password];
}

class LoginFormInitial extends LoginFormState {
  const LoginFormInitial()
      : super(
          username: '',
          password: '',
          isValid: false,
        );
}

class LoginFormFilled extends LoginFormState {
  final String inputUsername;
  final String inputPassword;
  final bool inputIsValid;
  const LoginFormFilled({
    required this.inputUsername,
    required this.inputPassword,
    required this.inputIsValid,
  }) : super(
          username: inputUsername,
          password: inputPassword,
          isValid: inputIsValid,
        );
  @override
  List<Object?> get props => [inputUsername, inputPassword];
}
