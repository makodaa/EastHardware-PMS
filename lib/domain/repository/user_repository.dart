import 'package:easthardware_pms/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(int id);
  Future<User?> getUserByUsername(String username);

  Future<bool> addUser(User user);
  Future<bool> updateUser(int id, User user);
  Future<bool> deleteUser(int id);
}
