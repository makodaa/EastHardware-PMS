part of 'user_form_bloc.dart';

sealed class UserFormEvent extends Equatable {
  const UserFormEvent();

  @override
  List<Object> get props => [];
}

class UserIdChangedEvent extends UserFormEvent {
  final int userId;
  const UserIdChangedEvent(this.userId);
}

class FirstNameFieldChangedEevnt extends UserFormEvent {
  final String firstName;
  const FirstNameFieldChangedEevnt(this.firstName);
}

class LastNameFieldChangedEevnt extends UserFormEvent {
  final String lastName;
  const LastNameFieldChangedEevnt(this.lastName);
}

class UsernameFieldChangedEevnt extends UserFormEvent {
  final String username;
  const UsernameFieldChangedEevnt(this.username);
}

class PasswordFieldChangedEevnt extends UserFormEvent {
  final String password;
  const PasswordFieldChangedEevnt(this.password);
}

class ConfirmPasswordFieldChangedEvent extends UserFormEvent {
  final String confirmPassword;
  const ConfirmPasswordFieldChangedEvent(this.confirmPassword);
}

class AccessLevelFieldChangedEvent extends UserFormEvent {
  final String accessLevel;
  const AccessLevelFieldChangedEvent(this.accessLevel);
}

class QuestionFieldChangedEevnt extends UserFormEvent {
  final int index;
  final String question;
  const QuestionFieldChangedEevnt(this.question, this.index);
}

class AnswerFieldChangedEevnt extends UserFormEvent {
  final int index;
  final String answer;
  const AnswerFieldChangedEevnt(this.answer, this.index);
}

class FormButtonPressedEvent extends UserFormEvent {}

class FormSubmittedEvent extends UserFormEvent {}

class FormResetEvent extends UserFormEvent {}
