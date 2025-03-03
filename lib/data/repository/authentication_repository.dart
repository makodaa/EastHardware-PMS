import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'package:easthardware_pms/data/repository/user_repository.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/repository/authentication_repository.dart';
import 'package:easthardware_pms/domain/repository/user_repository.dart';
import 'package:easthardware_pms/domain/services/cryptography_service.dart';

/// authentication_repository.dart
/// This dart file includes the implementation of the authentication abstract class in the domain
///
/// The AuthenticationRepository implementation shall be responsible for defining authentication domain functions (e.g. Logging in, Logging out) that have additional logic aside from interacting with the database.
///

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final UserRepository _userRepository = UserRepositoryImpl();
  final CryptographyService _cryptographyService = CryptographyService();

  /// Attempts to log in a user with inputted credentials
  /// @param [username] The string username of the user
  /// @param [password] The string password of the user
  /// @returns user if the login was successful to pass throughout the app
  /// @throws [AuthenticationException] if the username or password is invalid
  ///
  @override
  Future<User> logIn({
    required String username,
    required String password,
  }) async {
    final User? user = await _userRepository.getUserByUsername(username);

    // Check if user exists in database
    if (user == null) {
      throw AuthenticationException('Invalid username or password.');
    }

    Uint8List password_bytes = utf8.encode(password);
    Uint8List hashed_password = _cryptographyService.hashPasswordBytes([
      ...password_bytes,
      ...user.salt,
    ]);

    // Check if password matches stored password
    if (hashed_password != user.password_hash) {
      throw AuthenticationException('Invalid username or password');
    }

    return user;
  }

  @override
  void logOut() {}

  @override
  void dispose() {}
}
