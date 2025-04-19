import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/unit_repository.dart';
import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/domain/models/unit.dart';
import 'package:equatable/equatable.dart';

part 'unit_list_event.dart';
part 'unit_list_state.dart';

class UnitListBloc extends Bloc<UnitListEvent, UnitListState> {
  UnitListBloc(this._repository) : super(UnitListInitial()) {
    on<LoadUnitsEvent>(_onLoad);
    on<ReloadUnitsEvent>(_onReload);
    on<AddUnitEvent>(_onAdd);
    on<UpdateUnitEvent>(_onUpdate);
    on<DeleteUnitEvent>(_onDelete);
    on<FilterUnitsEvent>(_onFilter);
  }

  final UnitRepositoryImpl _repository;

  // TODO: try refactor these shi
  void _onLoad(LoadUnitsEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      emit(state.copyWith(
        units: await _repository.getAllUnits(),
        status: DataStatus.success,
      ));
      print('Units loaded: ${state.units.length}');
    } catch (e) {
      print('Error loading units: $e');
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onFilter(FilterUnitsEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      emit(state.copyWith(
        filteredUnits: await _repository.getAllUnitsOfProductId(event.productId),
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onReload(ReloadUnitsEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      emit(state.copyWith(
        units: await _repository.getAllUnits(),
        filteredUnits: null,
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onAdd(AddUnitEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.insertUnit(event.unit);
      emit(state.copyWith(
        units: await _repository.getAllUnits(),
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onUpdate(UpdateUnitEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.updateUnit(event.unit);
      emit(state.copyWith(
        units: await _repository.getAllUnits(),
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onDelete(DeleteUnitEvent event, Emitter emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.deleteUnit(event.unitId);
      emit(state.copyWith(
        units: await _repository.getAllUnits(),
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
    }
  }
}
