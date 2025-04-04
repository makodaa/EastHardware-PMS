import 'dart:async';
// import 'package:easthardware_pms/data/database/tables/products_table.dart';
import 'package:easthardware_pms/data/database/tables/categories_table.dart';
import 'package:easthardware_pms/data/database/tables/expense_types_table.dart';
import 'package:easthardware_pms/data/database/tables/invoice_products_table.dart';
import 'package:easthardware_pms/data/database/tables/invoices_table.dart';
import 'package:easthardware_pms/data/database/tables/order_products_table.dart';
import 'package:easthardware_pms/data/database/tables/orders_table.dart';
import 'package:easthardware_pms/data/database/tables/payment_methods_table.dart';
import 'package:easthardware_pms/data/database/tables/products_table.dart';
import 'package:easthardware_pms/data/database/tables/units_table.dart';
import 'package:easthardware_pms/data/database/tables/user_logs_table.dart';
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
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    final String path = join(await getDatabasesPath(), 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
  }

  Future<void> onCreate(Database database, int version) async {
    // DO NOT CHANGE ORDER BRO
    CategoriesTable.createTable(database);
    ExpenseTypesTable.createTable(database);
    PaymentMethodsTable.createTable(database);
    UsersTable.createTable(database);
    UserLogsTable.createTable(database);
    ProductsTable.createTable(database);
    UnitsTable.createTable(database);
    OrdersTable.createTable(database);
    OrderProductsTable.createTable(database);
    InvoicesTable.createTable(database);
    InvoiceProductsTable.createTable(database);
  }

  Future<void> onUpgrade(Database database, int oldVersion, int newVersion) async {}
}
