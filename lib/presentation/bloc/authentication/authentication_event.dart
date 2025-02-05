part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  const AuthenticationLoginEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}
