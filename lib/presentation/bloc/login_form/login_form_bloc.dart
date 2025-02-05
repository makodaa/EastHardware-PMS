import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormInitial()) {
    on<LoginFormEvent>((event, emit) {});
    on<LoginFormUsernameChangedEvent>(_onUsernameChanged);
    on<LoginFormPasswordChangedEvent>(_onPasswordChanged);
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

  bool _checkValidity(String email, String password) => email.isNotEmpty && password.isNotEmpty;
}
