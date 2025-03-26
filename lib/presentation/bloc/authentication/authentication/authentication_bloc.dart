import 'package:easthardware_pms/data/mock/mock.dart';
import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._repository) : super(AuthenticationState()) {
    on<AuthenticationLoginEvent>(_onLogin);
    on<AuthenticationLogoutEvent>((event, emit) {});
  }

  final AuthenticationRepositoryImpl _repository;

  void _onLogin(AuthenticationLoginEvent event, Emitter emit) {
    try {
      emit(state.copyWith(status: AuthenticationStatus.loading));

      User mock = Mock.user;
      emit(state.copyWith(
        user: mock,
        status: AuthenticationStatus.success,
      ));
    } catch (e) {
      return emit(state.copyWith(
        status: AuthenticationStatus.failure,
        loginAttempts: state.loginAttempts + 1,
      ));
    }
  }
}
