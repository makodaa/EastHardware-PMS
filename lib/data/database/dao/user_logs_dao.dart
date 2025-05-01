import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/domain/models/user_log.dart';

abstract class UserLogsDao {
  UserLogsDao._();
  factory UserLogsDao([DatabaseHelper? databaseHelper]) {
    return UserLogsDaoImpl._(databaseHelper);
  }
  Future<List<UserLog>> getAllUserLogs();
  Future<UserLog?> getUserLogById(int id);
  Future<UserLog?> getUserLogByUid(String uid);
  Future<List<UserLog>> getUserLogsByUserId(int id);
  Future<List<UserLog>> getUserLogsByEventTime(DateTime start, DateTime end);
  Future<UserLog> insertUserLog(UserLog userLog);
  Future<UserLog> updateUserLog(UserLog userLog);
  Future<void> deleteUserLog(UserLog userLog);
}

class UserLogsDaoImpl extends UserLogsDao {
  final DatabaseHelper _databaseHelper;
  UserLogsDaoImpl._([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper(),
        super._();
  @override
  Future<void> deleteUserLog(UserLog userLog) async {
    final database = await _databaseHelper.database;
    await database.delete(
      'user_logs',
      where: 'id = ?',
      whereArgs: [userLog.id],
    );
  }

  @override
  Future<List<UserLog>> getAllUserLogs() async {
    final database = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await database.query('user_logs');
    return List.generate(maps.length, (i) {
      return UserLog.fromMap(maps[i]);
    });
  }

  @override
  Future<UserLog?> getUserLogById(int id) async {
    final database = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await database.query(
      'user_logs',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return UserLog.fromMap(maps.first);
  }

  @override
  Future<UserLog> insertUserLog(UserLog userLog) async {
    final database = await _databaseHelper.database;
    final id = await database.insert('user_logs', userLog.toMap());
    return userLog.copyWith(id: id);
  }

  @override
  Future<UserLog> updateUserLog(UserLog userLog) async {
    final database = await _databaseHelper.database;
    await database.update(
      'user_logs',
      userLog.toMap(),
      where: 'id = ?',
      whereArgs: [userLog.id],
    );
    return userLog;
  }

  @override
  Future<List<UserLog>> getUserLogsByUserId(int id) async {
    final database = await _databaseHelper.database;
    final maps = await database.query('user_logs', where: 'user_id = ?', whereArgs: [id]);
    return List.generate(maps.length, (i) {
      return UserLog.fromMap(maps[i]);
    });
  }

  @override
  Future<List<UserLog>> getUserLogsByEventTime(DateTime start, DateTime end) async {
    final database = await _databaseHelper.database;
    final maps = await database.query(
      'user_logs',
      where: 'date(event_time) BETWEEN date(?) AND date(?)',
      whereArgs: [start, end],
    );
    return List.generate(maps.length, (i) {
      return UserLog.fromMap(maps[i]);
    });
  }

  @override
  Future<UserLog?> getUserLogByUid(String uid) async {
    final database = await _databaseHelper.database;
    final maps = await database.query(
      'user_logs',
      where: 'uid = ?',
      whereArgs: [uid],
    );
    if (maps.isEmpty) return null;
    return UserLog.fromMap(maps.first);
  }
}
