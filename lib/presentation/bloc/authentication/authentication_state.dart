part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  final int loginCount;
  const AuthenticationState(this.loginCount);

  @override
  List<Object> get props => [loginCount];
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial(super.loginCount);
}

final class AuthenticationLoginLoadingState extends AuthenticationState {
  const AuthenticationLoginLoadingState(super.loginCount);
}

final class AuthenticationLoginSuccessState extends AuthenticationState {
  final User user;
  const AuthenticationLoginSuccessState(this.user) : super(0);

  @override
  List<Object> get props => [user];
}

final class AuthenticationLoginFailureState extends AuthenticationState {
  final String message;
  const AuthenticationLoginFailureState({required this.message, required loginCount})
      : super(loginCount);

  @override
  List<Object> get props => [message];
}
