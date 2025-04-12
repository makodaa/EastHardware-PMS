import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final GlobalKey<FormState> formKey;

  LoginFormBloc()
      : formKey = GlobalKey<FormState>(),
        super(const LoginFormState()) {
    on<LoginFormUsernameChanged>(_onUsernameChanged);
    on<LoginFormPasswordChanged>(_onPasswordChanged);
    on<LoginFormButtonPressed>(_onButtonPressed);
    on<LoginFormResetEvent>(_onReset);
  }

  void _onUsernameChanged(LoginFormUsernameChanged event, Emitter emit) {
    final username = event.username;
    return emit(state.copyWith(username: username));
  }

  void _onPasswordChanged(LoginFormPasswordChanged event, Emitter emit) {
    print('pass ass ${event.password}');
    final password = event.password;
    return emit(state.copyWith(password: password));
  }

  void _onButtonPressed(LoginFormButtonPressed event, Emitter emit) async {
    emit(state.copyWith(isValidating: true));

    if (formKey.currentState case FormState formState when formState.validate()) {
      emit(state.copyWith(isSubmitting: true, isValidating: false));
    } else {
      emit(state.copyWith(isSubmitting: false, isValidating: false));
    }
  }

  void _onReset(LoginFormResetEvent event, Emitter emit) {
    emit(const LoginFormState());
  }
}
