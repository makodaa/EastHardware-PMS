part of 'login_form_bloc.dart';

class LoginFormState {
  final String username;
  final String password;
  final bool isSubmitting;
  final bool? isValid;

  final String? usernameFieldError;
  final String? passwordFieldError;

  const LoginFormState({
    this.username = '',
    this.password = '',
    this.isSubmitting = false,
    this.isValid,
    this.usernameFieldError,
    this.passwordFieldError,
  });

  LoginFormState copyWith({
    String? username,
    String? password,
    int? loginCount,
    bool? isSubmitting,
    bool? isValid,
    String? usernameFieldError,
    String? passwordFieldError,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isValid: isValid ?? this.isValid,
      usernameFieldError: this.usernameFieldError,
      passwordFieldError: this.passwordFieldError,
    );
  }
}
