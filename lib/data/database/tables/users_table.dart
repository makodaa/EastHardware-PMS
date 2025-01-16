// ignore: dangling_library_doc_comments
/// users_table.dart
/// Defines the table name, column names, and provides a method
/// to create the table in the database

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UsersTable {
  static const String USERS_TABLE_NAME = 'users';
  static const String USERS_ID = 'id';
  static const String USERS_USERNAME = 'username';
  static const String USERS_PASSWORD_HASH = 'password_hash';
  static const String USERS_FIRST_NAME = 'first_name';
  static const String USERS_LAST_NAME = 'last_name';
  static const String USERS_ACCESS_LEVEL = 'access_level';
  static const String USERS_SALT = 'salt';

  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $USERS_TABLE_NAME (
      $USERS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $USERS_USERNAME TEXT NOT NULL,
      $USERS_PASSWORD_HASH BLOB NOT NULL,
      $USERS_FIRST_NAME TEXT NOT NULL,
      $USERS_LAST_NAME TEXT NOT NULL,
      $USERS_ACCESS_LEVEL INTEGER NOT NULL,
      $USERS_SALT INTEGER NOT NULL,
    )
  ''');
  }
}
