import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryImpl _authentication_repository;
  AuthenticationBloc(this._authentication_repository) : super(AuthenticationInitial()) {
    on<AuthenticationLoginEvent>(_login);
    on<AuthenticationLogoutEvent>(_logout);
  }

  Future<void> _login(AuthenticationLoginEvent event, Emitter emit) async {
    emit(AuthenticationLoginLoadingState());

    try {
      final User user = await _authentication_repository.logIn(
          username: event.username, password: event.password);
      emit(AuthenticationLoginSuccessState(user));
    } catch (e) {
      emit(AuthenticationLoginFailureState(e.toString()));
    }
  }

  Future<void> _logout(AuthenticationEvent event, Emitter emit) async {
    emit(AuthenticationLogoutEvent());
  }
}
