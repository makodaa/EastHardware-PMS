import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_form_state.dart';
part 'login_form_event.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<LoginFormUsernameChanged>(_onUsernameChanged);
    on<LoginFormPasswordChanged>(_onPasswordChanged);
    on<LoginFormButtonPressed>(_onButtonPressed);
  }

  void _onUsernameChanged(LoginFormUsernameChanged event, Emitter emit) {
    final username = event.username;
    return emit(state.copyWith(username: username));
  }

  void _onPasswordChanged(LoginFormPasswordChanged event, Emitter emit) {
    final password = event.password;
    return emit(state.copyWith(password: password));
  }

  void _onButtonPressed(LoginFormButtonPressed event, Emitter emit) async {
    if (state.username.isNotEmpty && state.password.isNotEmpty) {
      emit(state.copyWith(isSubmitting: true));
      emit(state.copyWith(isSubmitting: true));
    }
    return emit(state.copyWith(
      isSubmitting: false,
      isValid: false,
      usernameFieldError: "Username cannot be empty.",
      passwordFieldError: "Password cannot be empty.",
    ));
  }
}
