import 'package:easthardware_pms/data/database/dao/users_dao.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl() : super();

  final UsersDao _usersDao = UsersDaoImpl();

  @override
  Future<bool> addUser(User user) {
    // TODO: check if function works properly when adding a duplicate
    return _usersDao.insertUser(user);
  }

  @override
  Future<bool> deleteUser(int id) {
    return _usersDao.deleteUser(id);
  }

  @override
  Future<User?> getUserById(int id) {
    return _usersDao.getUserById(id);
  }

  @override
  Future<User?> getUserByUsername(String username) {
    return _usersDao.getUserByUsername(username);
  }

  @override
  Future<List<User>> getAllUsers() {
    return _usersDao.getAllUsers();
  }

  @override
  Future<bool> updateUser(int id, User user) {
    return _usersDao.updateUser(id, user);
  }
}
