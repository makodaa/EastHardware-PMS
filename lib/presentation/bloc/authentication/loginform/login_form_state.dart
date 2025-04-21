part of 'login_form_bloc.dart';

const undefined = #undefined;

class LoginFormState {
  final String username;
  final String password;
  final FormStatus status;

  const LoginFormState({
    this.username = '',
    this.password = '',
    this.status = FormStatus.initial,
  });

  LoginFormState Function({
    String? username,
    String? password,
    FormStatus? status,
  }) get copyWith => _copyWith;

  LoginFormState _copyWith({
    Object? username = undefined,
    Object? password = undefined,
    Object? status = undefined,
  }) {
    return LoginFormState(
      username: username.or(this.username),
      password: password.or(this.password),
      status: status.or(this.status),
    );
  }
}

extension on Object? {
  T or<T>(T value) => this == undefined ? value : this as T;
}
