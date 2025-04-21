import 'package:easthardware_pms/domain/enums/enums.dart';
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
    on<LoginFormReturned>(_onFormReturned);
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

  void _onButtonPressed(LoginFormButtonPressed event, Emitter emit) {
    emit(state.copyWith(status: FormStatus.validating));

    if (formKey.currentState case FormState formState when formState.validate()) {
      emit(state.copyWith(status: FormStatus.submitting));
    } else {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void _onFormReturned(LoginFormReturned event, Emitter emit) async {
    emit(state.copyWith(status: FormStatus.initial));
  }

  void _onReset(LoginFormResetEvent event, Emitter emit) {
    emit(const LoginFormState());
  }
}
