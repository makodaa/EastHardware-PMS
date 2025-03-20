part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, loading, success, failure }

class AuthenticationState {
  final AuthenticationStatus status;
  final User? user;
  final int loginAttempts;

  AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.loginAttempts = 0,
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user,
    int? loginAttempts,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
      loginAttempts: loginAttempts ?? this.loginAttempts,
    );
  }
}
