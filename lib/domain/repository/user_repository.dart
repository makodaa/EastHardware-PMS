import 'package:easthardware_pms/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(int id);
  Future<User?> getUserByUsername(String username);

  Future<void> addUser(User user);
  Future<void> updateUser(int id, User user);
  Future<void> deleteUser(int id);
}
