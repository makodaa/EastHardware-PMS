part of 'unit_form_bloc.dart';

sealed class UnitFormEvent extends Equatable {
  const UnitFormEvent();

  @override
  List<Object> get props => [];
}

class UnitFieldNameChanged extends UnitFormEvent {
  final int index;
  final String name;
  const UnitFieldNameChanged({
    required this.index,
    required this.name,
  });
}

class UnitFieldFactorChanged extends UnitFormEvent {
  final int index;
  final String factor;

  const UnitFieldFactorChanged({required this.index, required this.factor});
}

class UnitFieldAdded extends UnitFormEvent {}

class UnitFieldDeleted extends UnitFormEvent {
  final int index;
  const UnitFieldDeleted({
    required this.index,
  });
}

class UnitFormSubmitted extends UnitFormEvent {}

class UnitFormResetEvent extends UnitFormEvent {}
