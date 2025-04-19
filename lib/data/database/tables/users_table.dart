import 'dart:typed_data';

import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:easthardware_pms/domain/services/cryptography_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UsersTable {
  static const String USERS_TABLE_NAME = 'users';
  static const String USERS_ID = 'id';
  static const String USERS_UID = 'uid';
  static const String USERS_USERNAME = 'username';
  static const String USERS_PASSWORD_HASH = 'password_hash';
  static const String USERS_FIRST_NAME = 'first_name';
  static const String USERS_LAST_NAME = 'last_name';
  static const String USERS_ACCESS_LEVEL = 'access_level';
  static const String USERS_SALT = 'salt';

  static void createTable(Database database) async {
    await database.execute('''
      CREATE TABLE $USERS_TABLE_NAME (
      $USERS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $USERS_UID TEXT NOT NULL,
      $USERS_USERNAME TEXT NOT NULL UNIQUE,
      $USERS_PASSWORD_HASH BLOB NOT NULL,
      $USERS_FIRST_NAME TEXT NOT NULL,
      $USERS_LAST_NAME TEXT NOT NULL,
      $USERS_ACCESS_LEVEL INTEGER NOT NULL,
      $USERS_SALT INTEGER NOT NULL
    )
  ''');
    _insertInitialAdmin(database);
  }

  static void dropTable(Database database) async {
    await database.execute('DROP TABLE IF EXISTS $USERS_TABLE_NAME');
  }

  // private function: create initial admin
  static void _insertInitialAdmin(Database database) async {
    const CryptographyService cryptographyService = CryptographyService();
    const String password = 'Admin123';
    Uint8List salt = cryptographyService.generateSalt();
    Uint8List passwordHash = cryptographyService.generateHash(password, salt);

    User admin = User(
      firstName: 'System',
      lastName: 'Administrator',
      username: 'admin',
      accessLevel: AccessLevel.admin,
      passwordHash: passwordHash,
      salt: salt,
    );

    database.insert(UsersTable.USERS_TABLE_NAME, admin.toMap());
  }
}
