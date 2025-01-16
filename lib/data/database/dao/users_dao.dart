import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/data/database/tables/users_table.dart';
import 'package:easthardware_pms/domain/models/user.dart';

abstract class UsersDao {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(int id);
  Future<User?> getUserByUsername(String username);

  Future<bool> insertUser(User user);
  Future<bool> updateUser(int id, User user);
  Future<bool> deleteUser(int id);
}

class UsersDaoImpl extends UsersDao {
  final DatabaseHelper _databaseHelper;

  UsersDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  @override
  Future<List<User>> getAllUsers() async {
    final database = await _databaseHelper.database;
    var res = await database.query(UsersTable.USERS_TABLE_NAME);

    List<User>? users = res.isNotEmpty ? res.map((row) => User.fromMap(row)).toList() : [];

    return users;
  }

  @override
  Future<User?> getUserById(int id) async {
    final database = await _databaseHelper.database;
    var res = await database.query(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_ID} = ?",
      whereArgs: [id],
    );

    User? user = res.isNotEmpty ? User.fromMap(res.first) : null;

    return user;
  }

  @override
  Future<User?> getUserByUsername(String username) async {
    final database = await _databaseHelper.database;
    var res = await database.query(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_USERNAME} = ?",
      whereArgs: [username],
    );

    User? user = res.isNotEmpty ? User.fromMap(res.first) : null;

    return user;
  }

  @override
  Future<bool> insertUser(User user) async {
    final database = await _databaseHelper.database;
    var res = await database.insert(UsersTable.USERS_TABLE_NAME, user.toMap());
    return res != 0;
  }

  @override
  Future<bool> updateUser(int id, User user) async {
    final database = await _databaseHelper.database;
    var res = await database.update(
      UsersTable.USERS_TABLE_NAME,
      user.toMap(),
      where: "${UsersTable.USERS_ID} = ?",
      whereArgs: [id],
    );
    return res != 0;
  }

  @override
  Future<bool> deleteUser(int id) async {
    final database = await _databaseHelper.database;
    var res = await database.delete(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_ID} = ?",
      whereArgs: [id],
    );

    return res != 0;
  }
}
