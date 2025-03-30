part of 'authentication_bloc.dart';


enum AuthenticationStatus { unknown, loading, success, failure }

enum FormElement {
  username,
  password,
  passwordVerification,
  securityQuestion,
  securityAnswer
}

class ErrorMessage {
  final String message;
  final FormElement target;

  const ErrorMessage({required this.message, required this.target});
}

class AuthenticationState {
  final AuthenticationStatus status;
  final User? user;
  final int loginAttempts;
  final List<ErrorMessage> errors;

  AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.loginAttempts = 0,
    this.errors = const [],
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user,
    int? loginAttempts,
    List<ErrorMessage>? errors,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
      loginAttempts: loginAttempts ?? this.loginAttempts,
      errors: errors ?? this.errors,
    );
  }
}
