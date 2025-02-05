part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoginLoadingState extends AuthenticationState {}

final class AuthenticationLoginSuccessState extends AuthenticationState {
  final User user;
  const AuthenticationLoginSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

final class AuthenticationLoginFailureState extends AuthenticationState {
  final String message;

  const AuthenticationLoginFailureState(this.message);

  @override
  List<Object> get props => [message];
}
