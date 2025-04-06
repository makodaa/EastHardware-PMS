import 'package:easthardware_pms/domain/models/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

//# Why is there separate repository + impl bruhh
//https://media.tenor.com/QgTx6fv4IpAAAAAM/el-risitas-juan-joya-borja.gif
abstract class AuthenticationRepository {
  Future<User> logIn({required String username, required String password});
  void logOut();
  void dispose();
}
