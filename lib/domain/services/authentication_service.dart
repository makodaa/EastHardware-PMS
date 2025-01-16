import 'package:crypto/crypto.dart';
import 'dart:convert';

abstract class AuthenticationService {
  int hashPassword(String password);
  bool doPasswordsMatch(String password, int hash);
}

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  int hashPassword(String password) {
    return int.parse((sha256.convert(utf8.encode(password)).bytes).join(''));
  }

  @override
  bool doPasswordsMatch(String password, int hash) {
    return hashPassword(password) == hash;
  }
}
