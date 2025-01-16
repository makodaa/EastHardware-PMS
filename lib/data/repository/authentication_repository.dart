import 'dart:async';
import 'package:easthardware_pms/data/repository/user_repository.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/repository/user_repository.dart';
import 'package:easthardware_pms/domain/services/authentication_service.dart';
import 'package:flutter/foundation.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final UserRepository _userRepository = UserRepositoryImpl();
  final AuthenticationService _authenticationService = AuthenticationServiceImpl();

  final _controller = StreamController<AuthenticationStatus>();
  AuthenticationStatus _status = AuthenticationStatus.unknown;

  Stream<AuthenticationStatus> get status async* {
    yield _status;
    yield* _controller.stream;
  }

  @override
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      User? user = await _userRepository.getUserByUsername(username);
      if (user == null) {
        _status = AuthenticationStatus.unauthenticated;
        _controller.add(_status);
        return;
      }
      if (_authenticationService.doPasswordsMatch(password, user.password_hash)) {
        _status = AuthenticationStatus.authenticated;
        _controller.add(_status);
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
      _status = AuthenticationStatus.unauthenticated;
      _controller.add(_status);
    }
  }

  @override
  void logOut() {
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
