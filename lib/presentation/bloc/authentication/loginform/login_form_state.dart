part of 'login_form_bloc.dart';

const undefined = #undefined;

class LoginFormState {
  final String username;
  final String password;
  final bool isSubmitting;
  final bool isValidating;

  final String? usernameFieldError;
  final String? passwordFieldError;

  const LoginFormState({
    this.username = '',
    this.password = '',
    this.isSubmitting = false,
    this.isValidating = false,
    this.usernameFieldError,
    this.passwordFieldError,
  });

  LoginFormState Function({
    String? username,
    String? password,
    bool? isSubmitting,
    bool? isValidating,
    String? usernameFieldError,
    String? passwordFieldError,
  }) get copyWith => _copyWith;

  LoginFormState _copyWith({
    Object? username = undefined,
    Object? password = undefined,
    Object? isSubmitting = undefined,
    Object? isValidating = undefined,
    Object? usernameFieldError = undefined,
    Object? passwordFieldError = undefined,
  }) {
    return LoginFormState(
      username: username.or(this.username),
      password: password.or(this.password),
      isSubmitting: isSubmitting.or(this.isSubmitting),
      isValidating: isValidating.or(this.isValidating),
      usernameFieldError: usernameFieldError.or(this.usernameFieldError),
      passwordFieldError: passwordFieldError.or(this.passwordFieldError),
    );
  }
}

extension on Object? {
  T or<T>(T value) => this == undefined ? value : this as T;
}
