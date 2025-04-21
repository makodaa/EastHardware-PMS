import 'package:easthardware_pms/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(int id);
  Future<User?> getUserByUsername(String username);

  Future<User> insertUser(User user);
  Future<User> updateUser(User user);
  Future<void> deleteUser(User user);
}
