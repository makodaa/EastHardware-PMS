part of 'login_form_bloc.dart';

const undefined = #undefined;

class LoginFormState {
  final String username;
  final String password;
  final bool isSubmitting;
  final bool isValidating;

  const LoginFormState({
    this.username = '',
    this.password = '',
    this.isSubmitting = false,
    this.isValidating = false,
  });

  LoginFormState Function({
    String? username,
    String? password,
    bool? isSubmitting,
    bool? isValidating,
  }) get copyWith => _copyWith;

  LoginFormState _copyWith({
    Object? username = undefined,
    Object? password = undefined,
    Object? isSubmitting = undefined,
    Object? isValidating = undefined,
  }) {
    return LoginFormState(
      username: username.or(this.username),
      password: password.or(this.password),
      isSubmitting: isSubmitting.or(this.isSubmitting),
      isValidating: isValidating.or(this.isValidating),
    );
  }
}

extension on Object? {
  T or<T>(T value) => this == undefined ? value : this as T;
}
