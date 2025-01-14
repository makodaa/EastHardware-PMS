import 'package:easthardware_pms/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getAllUsers();
  Future<User> getUserById();
  Future<User> getUserByUsername();

  Future<User> addUser();
  Future<User> updateUser();
  Future<User> deleteUser();
}
