import 'dart:async';
// import 'package:easthardware_pms/data/database/tables/products_table.dart';
import 'package:easthardware_pms/data/database/tables/users_table.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

/// database_helper.dart
/// This file contains the DatabaseHelper class
///
/// The DatabaseHelper class shall be responsible for creating the tables on creating, initializing, and upgrading the SQLite database.
///
/// Any data manipulation functions should be created in DAOs respective to entities.

class DatabaseHelper {
  /// Ensures there is only one instance of the database all througouht the applicaiton
  /// This avoids any conflicts from multiple connections
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
  }

  Future<void> onCreate(Database database, int version) async {
    UsersTable.createTable(database, version);
  }

  Future<void> onUpgrade(Database database, int old_version, int new_version) async {}
}
