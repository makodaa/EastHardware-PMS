import 'package:easthardware_pms/data/database/dao/users_dao.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl() : super();

  final UsersDao _usersDao = UsersDaoImpl();

  @override
  Future<bool> addUser(User user) async {
    try {
      return _usersDao.insertUser(user);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> deleteUser(int id) async {
    try {
      return _usersDao.deleteUser(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<User?> getUserById(int id) {
    try {
      return _usersDao.getUserById(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<User?> getUserByUsername(String username) {
    try {
      return _usersDao.getUserByUsername(username);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<User>> getAllUsers() {
    try {
      return _usersDao.getAllUsers();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> updateUser(int id, User user) async {
    try {
      return _usersDao.updateUser(id, user);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
