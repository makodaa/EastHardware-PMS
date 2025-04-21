import 'package:easthardware_pms/domain/models/user_log.dart';

abstract class UserLogRepository {
  Future<List<UserLog>> getAllUserLogs();
  Future<UserLog?> getUserLogById(int id);
  Future<List<UserLog>> getUserLogByUserId(int id);

  Future<UserLog> insertUserLog(UserLog userLog);
  Future<UserLog> updateUserLog(UserLog userLog);
  Future<void> deleteUserLog(UserLog userLog);
}
