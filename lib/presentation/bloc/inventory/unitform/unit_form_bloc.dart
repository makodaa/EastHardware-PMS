import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/domain/models/unit.dart';
import 'package:equatable/equatable.dart';

part 'unit_form_event.dart';
part 'unit_form_state.dart';

class UnitFormBloc extends Bloc<UnitFormEvent, UnitFormState> {
  UnitFormBloc() : super(const UnitFormInitial()) {
    on<UnitFieldNameChanged>(_onFieldNameChanged);
    on<UnitFieldFactorChanged>(_onFieldFactorChanged);
    on<UnitFieldAdded>(_onFieldAdded);
    on<UnitFieldDeleted>(_onFieldDeleted);
    on<UnitFormSubmitted>(_onFormSubmitted);
    on<UnitFormResetEvent>(_onFormReset);
  }

  void _onFieldNameChanged(UnitFieldNameChanged event, Emitter emit) {
    List<Unit> units = List.from(state.units);
    if (units.length > event.index) {
      units[event.index] = units[event.index].copyWith(name: event.name);
    } else {
      units.add(Unit(name: event.name, conversionFactor: 1));
    }
    emit(state.copyWith(units: units));
  }

  void _onFieldFactorChanged(UnitFieldFactorChanged event, Emitter emit) {
    List<Unit> units = List.from(state.units);
    if (units.length > event.index) {
      units[event.index] =
          units[event.index].copyWith(conversionFactor: double.parse(event.factor));
    } else {
      units.add(Unit(name: '', conversionFactor: double.parse(event.factor)));
    }
  }

  void _onFieldAdded(UnitFieldAdded event, Emitter emit) {
    List<Unit> units = List.from(state.units);
    units.add(Unit(name: '', conversionFactor: 1));
    emit(state.copyWith(units: units));
  }

  void _onFieldDeleted(UnitFieldDeleted event, Emitter emit) {
    List<Unit> units = List.from(state.units);
    if (units.length > event.index) {
      units.removeAt(event.index);
    }
    emit(state.copyWith(units: units));
  }

  void _onFormSubmitted(UnitFormSubmitted event, Emitter emit) {
    List<Unit> units = List.from(state.units);
    emit(state.copyWith(units: units));
  }

  void _onFormReset(UnitFormResetEvent event, Emitter emit) {
    emit(const UnitFormInitial());
  }
}
