part of 'unit_form_bloc.dart';

class UnitFormState extends Equatable {
  final List<Unit> units;

  const UnitFormState({
    this.units = const [],
  });

  UnitFormState copyWith({
    List<Unit>? units,
  }) {
    return UnitFormState(
      units: units ?? this.units,
    );
  }

  @override
  List<Object> get props => [units];
}

class UnitFormInitial extends UnitFormState {
  const UnitFormInitial() : super();
}
