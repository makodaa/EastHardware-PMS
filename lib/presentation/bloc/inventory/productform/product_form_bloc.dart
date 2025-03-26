import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_form_event.dart';
part 'product_form_state.dart';

class ProductformBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductformBloc() : super(const ProductFormState()) {
    on<NameFieldChangedEvent>(_onNameChanged);
    on<CategoryFieldChangedEvent>(_onCategoryChanged);
    on<DescriptionFieldChangedEvent>(_onDescriptionChanged);
    on<PriceFieldChangedEvent>(_onPriceChanged);
    on<CostFieldChangedEvent>(_onCostChanged);
    on<QuantityFieldChangedEvent>(_onQuantityChanged);
    on<MainUnitFieldChangedEvent>(_onMainUnitChanged);
    on<SecondaryUnitFieldChangedEvent>(_onSecondaryUnitsChanged);
    on<CriticalLevelFieldChangedEvent>(_onCriticalLevelChanged);
    on<DeadstockFieldChangedEvent>(_onDeadStockChanged);
    on<FastMovingStockFieldChangedEvent>(_onFastMovingStockChanged);
    on<ProductStatusChangedEvent>(_onProductStatusChanged);
    on<FormSubmittedEvent>(_onFormSubmitted);
  }

  void _onNameChanged(NameFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String name = event.name;
    return emit(state.copyWith(name: name));
  }

  void _onCategoryChanged(CategoryFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String category = event.category;
    return emit(state.copyWith(category: category));
  }

  void _onDescriptionChanged(DescriptionFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String description = event.description;
    return emit(state.copyWith(description: description));
  }

  void _onPriceChanged(PriceFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String price = event.price;
    return emit(state.copyWith(price: price));
  }

  void _onCostChanged(CostFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String cost = event.cost;
    return emit(state.copyWith(cost: cost));
  }

  void _onQuantityChanged(QuantityFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String quantity = event.quantity;
    return emit(state.copyWith(quantity: quantity));
  }

  void _onMainUnitChanged(MainUnitFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String mainUnit = event.unit;
    return emit(state.copyWith(mainUnit: mainUnit));
  }

  void _onSecondaryUnitsChanged(
      SecondaryUnitFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final Map<String, String> secondaryUnits = event.units;
    return emit(state.copyWith(secondaryUnits: secondaryUnits));
  }

  void _onCriticalLevelChanged(
      CriticalLevelFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String criticalLevel = event.criticalLevel;
    return emit(state.copyWith(criticalLevel: criticalLevel));
  }

  void _onDeadStockChanged(DeadstockFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String treshold = event.treshold;
    return emit(state.copyWith(deadstockTreshold: treshold));
  }

  void _onFastMovingStockChanged(
      FastMovingStockFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String treshold = event.treshold;
    return emit(state.copyWith(fastmovingTreshold: treshold));
  }

  void _onProductStatusChanged(ProductStatusChangedEvent event, Emitter<ProductFormState> emit) {
    final String status = event.status;
    return emit(state.copyWith(productStatus: status));
  }

  FutureOr<void> _onFormSubmitted(FormSubmittedEvent event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(formStatus: FormStatus.submitting));
    // TODO: hai
    // call product repository
    // call unit repository
    // call category repository
    // convert state to prduct entity
    // try insert to database
  }
}
