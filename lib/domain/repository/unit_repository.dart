import 'package:easthardware_pms/domain/models/unit.dart';

abstract class UnitRepository {
  Future<List<Unit>?> getAllUnits();
  Future<Unit?> getUnitById(int id);

  Future<bool> insertUnit(Unit unit);
  Future<bool> updateUnit(Unit unit);
  Future<bool> deleteUnit(int id);
}
