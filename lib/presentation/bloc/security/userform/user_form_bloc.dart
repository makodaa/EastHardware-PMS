import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/services/cryptography_service.dart';
import 'package:easthardware_pms/presentation/models/form_question.dart';
import 'package:equatable/equatable.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:uuid/uuid.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final GlobalKey<FormState> formKey;
  UserFormBloc()
      : formKey = GlobalKey<FormState>(),
        super(const UserFormState()) {
    on<UserIdChangedEvent>(_onUserIdChanged);
    on<FirstNameFieldChangedEevnt>(_onFirstNameChanged);
    on<LastNameFieldChangedEevnt>(_onLastNameChanged);
    on<UsernameFieldChangedEevnt>(_onUsernameChanged);
    on<PasswordFieldChangedEevnt>(_onPasswordChanged);
    on<ConfirmPasswordFieldChangedEvent>(_onConfirmPasswordChanged);
    on<AccessLevelFieldChangedEvent>(_onAccessLevelChanged);
    on<QuestionFieldChangedEevnt>(_onQuestionChanged);
    on<AnswerFieldChangedEevnt>(_onAnswerChanged);
    on<FormButtonPressedEvent>(_onButtonPressed);
    on<FormSubmittedEvent>(_onFormSubmitted);
    on<FormResetEvent>(_onFormReset);
  }

  void _onUserIdChanged(UserIdChangedEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(userId: event.userId));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onFirstNameChanged(FirstNameFieldChangedEevnt event, Emitter emit) async {
    try {
      emit(state.copyWith(firstName: event.firstName));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onLastNameChanged(LastNameFieldChangedEevnt event, Emitter emit) async {
    try {
      emit(state.copyWith(lastName: event.lastName));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onUsernameChanged(UsernameFieldChangedEevnt event, Emitter emit) async {
    try {
      emit(state.copyWith(username: event.username));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onPasswordChanged(PasswordFieldChangedEevnt event, Emitter emit) async {
    try {
      emit(state.copyWith(password: event.password));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onConfirmPasswordChanged(ConfirmPasswordFieldChangedEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onAccessLevelChanged(AccessLevelFieldChangedEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(accessLevel: event.accessLevel));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onQuestionChanged(QuestionFieldChangedEevnt event, Emitter emit) async {
    try {
      final String question = event.question;
      final int index = event.index;
      final List<FormQuestion> updatedQuestions = List.from(state.questions);

      updatedQuestions[index] = updatedQuestions[index].copyWith(question: question);
      emit(state.copyWith(questions: updatedQuestions));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onAnswerChanged(AnswerFieldChangedEevnt event, Emitter emit) async {
    try {
      final String answer = event.answer;
      final int index = event.index;
      final List<FormQuestion> updatedQuestions = List.from(state.questions);

      updatedQuestions[index] = updatedQuestions[index].copyWith(answer: answer);
      emit(state.copyWith(questions: updatedQuestions));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onButtonPressed(FormButtonPressedEvent event, Emitter emit) async {
    try {
      if (state.accessLevel.trim().isEmpty) {
        // For displaying error message
        emit(state.copyWith(accessLevelErrorMessage: 'Please select an access level'));
      }
      if (formKey.currentState case FormState formState when formState.validate()) {
        final uid = const Uuid().v4();
        final creationDate = DateTime.now().toIso8601String();
        final salt = CryptographyService.generateSalt();
        final passwordHash = CryptographyService.generateHash(state.password, salt);

        // For actually checking the access level
        if (state.accessLevel.isNotEmpty) {
          emit(state.copyWith(
            uid: uid,
            creationDate: creationDate,
            salt: salt,
            archiveStatus: 0,
            passwordHash: passwordHash,
            accessLevelErrorMessage: null,
            status: FormStatus.submitting,
          ));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onFormSubmitted(FormSubmittedEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: FormStatus.submitted));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onFormReset(FormResetEvent event, Emitter emit) async {
    try {
      emit(const UserFormState());
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}
