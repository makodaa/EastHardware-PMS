import 'package:easthardware_pms/data/database/dao/units_dao.dart';
import 'package:easthardware_pms/domain/errors/exceptions.dart';
import 'package:easthardware_pms/domain/models/unit.dart';
import 'package:easthardware_pms/domain/repository/unit_repository.dart';

class UnitRepositoryImpl extends UnitRepository {
  UnitRepositoryImpl() : super();

  final UnitsDaoImpl _unitsDao = UnitsDaoImpl();
  @override
  Future<bool> deleteUnit(int id) async {
    try {
      return _unitsDao.deleteUnit(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<Unit>?> getAllUnits() async {
    try {
      return _unitsDao.getAllUnits();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Unit?> getUnitById(int id) async {
    try {
      return _unitsDao.getUnitById(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> insertUnit(Unit unit) async {
    try {
      return _unitsDao.insertUnit(unit);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> updateUnit(Unit unit) async {
    try {
      return _unitsDao.insertUnit(unit);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
