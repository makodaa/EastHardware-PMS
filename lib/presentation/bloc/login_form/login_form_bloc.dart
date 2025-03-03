import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final AuthenticationRepository authRepo;

  LoginFormBloc(this.authRepo) : super(const LoginFormInitial()) {
    on<LoginFormEvent>((event, emit) {});
    on<LoginFormUsernameChangedEvent>(_onUsernameChanged);
    on<LoginFormPasswordChangedEvent>(_onPasswordChanged);
    on<LoginFormButtonPressedEvent>(_onButtonPressed);
  }

  Future _onUsernameChanged(LoginFormUsernameChangedEvent event, Emitter emit) async {
    emit(LoginFormFilled(
        input_username: event.username,
        input_password: state.password,
        input_is_valid: _checkValidity(event.username, state.password)));
  }

  Future _onPasswordChanged(LoginFormPasswordChangedEvent event, Emitter emit) async {
    emit(LoginFormFilled(
        input_username: state.username,
        input_password: event.password,
        input_is_valid: _checkValidity(state.username, event.password)));
  }

  Future<void> _onButtonPressed(LoginFormButtonPressedEvent event, Emitter emit) async {
    //# What's your plan? Esp. if LoginBloc only lives in the LoginPage.
    //# How do we make other Blocs (if they exist) subscribed to this?

    // validation

    if (kDebugMode) {
      print("Login button pressed");
    }

    // try {
    //   await authRepo.logIn(
    //     username: state.username,
    //     password: state.password,
    //   );
    // } on AuthenticationException {
    //   /// Failed to log in. What do we do.
    // }
  }

  bool _checkValidity(String email, String password) => email.isNotEmpty && password.isNotEmpty;
}
