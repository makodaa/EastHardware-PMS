import 'package:easthardware_pms/data/database/tables/users_table.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class UsersDao {
  Future<List<User>> getAllUsers();
  Future<List<User>> getUserById(int id);
  Future<List<User>> getUserByUsername(String username);
  Future<bool> insertUser(User user);
  Future<bool> updateUser(int id, User user);
  Future<bool> deleteUser(int id);
}

class UsersDaoImplementation extends UsersDao {
  final Database database;

  UsersDaoImplementation(this.database);

  @override
  Future<List<User>> getAllUsers() async {
    var res = await database.query(UsersTable.USERS_TABLE_NAME);

    List<User>? users = res.isNotEmpty ? res.map((row) => User.fromMap(row)).toList() : [];

    return users;
  }

  @override
  Future<List<User>> getUserById(int id) async {
    var res = await database.query(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_ID} = ?",
      whereArgs: [id],
    );

    List<User>? users = res.isNotEmpty ? res.map((row) => User.fromMap(row)).toList() : [];

    return users;
  }

  @override
  Future<List<User>> getUserByUsername(String username) async {
    var res = await database.query(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_USERNAME} = ?",
      whereArgs: [username],
    );

    List<User>? users = res.isNotEmpty ? res.map((row) => User.fromMap(row)).toList() : [];

    return users;
  }

  @override
  Future<bool> insertUser(User user) async {
    var res = await database.insert(UsersTable.USERS_TABLE_NAME, user.toMap());
    return res != 0;
  }

  @override
  Future<bool> updateUser(int id, User user) async {
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
    var res = await database.delete(
      UsersTable.USERS_TABLE_NAME,
      where: "${UsersTable.USERS_ID} = ?",
      whereArgs: [id],
    );

    return res != 0;
  }
}
