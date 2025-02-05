part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class LoginFormUsernameChangedEvent extends LoginFormEvent {
  final String username;
  const LoginFormUsernameChangedEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class LoginFormPasswordChangedEvent extends LoginFormEvent {
  final String password;
  const LoginFormPasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginFormButtonPressedEvent extends LoginFormEvent {}
