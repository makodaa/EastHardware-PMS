import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryImpl _repository;
  AuthenticationBloc(this._repository) : super(const AuthenticationInitial(0)) {
    on<AuthenticationLoginEvent>(_login);
    on<AuthenticationLogoutEvent>(_logout);
  }

  Future<void> _login(AuthenticationLoginEvent event, Emitter emit) async {
    final int current = state.loginCount;
    emit(AuthenticationLoginLoadingState(current));
    try {
      // TODO: Implement Repository Access
      // final User user = await _authentication_repository.logIn(
      //     username: event.username, password: event.password);
      emit(AuthenticationLoginSuccessState(User(
        1,
        "firstName",
        "lastName",
        "username",
        AccessLevel.administrator,
        Uint8List.fromList([1]),
        Uint8List.fromList([1]),
      )));
    } catch (e) {
      emit(AuthenticationLoginFailureState(message: e.toString(), loginCount: current + 1));
    }
  }
}

Future<void> _logout(AuthenticationEvent event, Emitter emit) async {
  emit(AuthenticationLogoutEvent());
}
