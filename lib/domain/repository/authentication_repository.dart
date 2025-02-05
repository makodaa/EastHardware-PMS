import 'package:easthardware_pms/domain/models/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthenticationRepository {
  Future<User> logIn({required String username, required String password});
  void logOut();
  void dispose();
}
