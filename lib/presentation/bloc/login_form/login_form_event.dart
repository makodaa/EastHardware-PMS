part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  // Redirecting constructors to assist in autocompletion.

  const factory LoginFormEvent.usernameChanged(String name) = LoginFormUsernameChangedEvent;
  const factory LoginFormEvent.passwordChanged(String password) = LoginFormPasswordChangedEvent;
  const factory LoginFormEvent.loginButtonPressed() = LoginFormButtonPressedEvent;

  @override
  List<Object?> get props => [];
}

final class LoginFormUsernameChangedEvent extends LoginFormEvent {
  final String username;
  const LoginFormUsernameChangedEvent(this.username);

  @override
  List<Object?> get props => [username];
}

final class LoginFormPasswordChangedEvent extends LoginFormEvent {
  final String password;
  const LoginFormPasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}

final class LoginFormButtonPressedEvent extends LoginFormEvent {
  const LoginFormButtonPressedEvent();

  /// What do you want to do?
}
