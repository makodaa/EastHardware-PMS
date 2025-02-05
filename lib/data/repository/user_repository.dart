import 'package:easthardware_pms/data/database/dao/users_dao.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl() : super();

  final UsersDao _usersDao = UsersDaoImpl();

  @override
  Future<void> addUser(User user) async {
    try {
      _usersDao.insertUser(user);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      _usersDao.deleteUser(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
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
  Future<void> updateUser(int id, User user) async {
    try {
      _usersDao.updateUser(id, user);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
