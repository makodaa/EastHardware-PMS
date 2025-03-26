import 'package:easthardware_pms/data/database/database_helper.dart';
import 'package:easthardware_pms/data/database/tables/units_table.dart';
import 'package:easthardware_pms/domain/models/unit.dart';

abstract class UnitsDao {
  Future<List<Unit>?> getAllUnits();
  Future<List<Unit>?> getAllUnitsOfProduct(int id);
  Future<Unit?> getUnitById(int id);

  Future<bool> insertUnit(Unit unit);
  Future<bool> updateUnit(Unit unit);
  Future<bool> deleteUnit(int id);
}

class UnitsDaoImpl extends UnitsDao {
  final DatabaseHelper _databaseHelper;

  UnitsDaoImpl([DatabaseHelper? databaseHelper])
      : _databaseHelper = databaseHelper ?? DatabaseHelper();

  @override
  Future<bool> deleteUnit(int id) async {
    final database = await _databaseHelper.database;
    var res = await database.delete(
      UnitsTable.UNITS_TABLE_NAME,
      where: "${UnitsTable.UNITS_TABLE_NAME} = ?",
      whereArgs: [id],
    );
    return res != 0;
  }

  @override
  Future<List<Unit>?> getAllUnits() async {
    final database = await _databaseHelper.database;
    var res = await database.query(UnitsTable.UNITS_TABLE_NAME);

    List<Unit>? units = res.isNotEmpty ? res.map(Unit.fromMap).toList() : [];
    return units;
  }

  @override
  Future<Unit?> getUnitById(int id) async {
    final database = await _databaseHelper.database;
    var res = await database.query(
      UnitsTable.UNITS_TABLE_NAME,
      where: "${UnitsTable.UNITS_ID} = ?",
      whereArgs: [id],
    );

    Unit? unit = res.isNotEmpty ? Unit.fromMap(res.first) : null;
    return unit;
  }

  @override
  Future<bool> insertUnit(Unit unit) async {
    final database = await _databaseHelper.database;
    var res = await database.insert(UnitsTable.UNITS_TABLE_NAME, unit.toMap());
    return res != 0;
  }

  @override
  Future<bool> updateUnit(Unit unit) async {
    final database = await _databaseHelper.database;
    var res = await database.update(
      UnitsTable.UNITS_TABLE_NAME,
      unit.toMap(),
      where: "${UnitsTable.UNITS_ID} = ?",
      whereArgs: [unit.id],
    );
    return res != 0;
  }

  @override
  Future<List<Unit>?> getAllUnitsOfProduct(int id) async {
    final database = await _databaseHelper.database;
    var res = await database.query(
      UnitsTable.UNITS_TABLE_NAME,
      where: "${UnitsTable.UNITS_PRODUCT_ID} = ?",
      whereArgs: [id],
    );

    List<Unit>? units = res.isNotEmpty ? res.map(Unit.fromMap).toList() : [];
    return units;
  }
}
