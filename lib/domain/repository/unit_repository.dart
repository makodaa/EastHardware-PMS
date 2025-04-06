import 'package:easthardware_pms/domain/models/unit.dart';

abstract class UnitRepository {
  Future<List<Unit>?> getAllUnits();
  Future<Unit?> getUnitById(int id);

  Future<Unit> insertUnit(Unit unit);
  Future<Unit> updateUnit(Unit unit);
  Future<void> deleteUnit(int id);
}
