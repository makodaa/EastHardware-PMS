part of 'unit_list_bloc.dart';

class UnitListState {
  const UnitListState({
    required this.status,
    required this.units,
    this.filteredUnits,
  });

  final DataStatus status;
  final List<Unit> units;
  final List<Unit>? filteredUnits;

  UnitListState copyWith({
    DataStatus? status,
    List<Unit>? units,
    List<Unit>? filteredUnits,
  }) {
    return UnitListState(
      status: status ?? this.status,
      units: units ?? this.units,
      filteredUnits: filteredUnits ?? this.filteredUnits,
    );
  }
}

final class UnitListInitial extends UnitListState {
  UnitListInitial()
      : super(
          status: DataStatus.initial,
          units: [],
        );
}
