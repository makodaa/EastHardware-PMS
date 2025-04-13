import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'product_form_event.dart';
part 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final GlobalKey<FormState> formKey;
  ProductFormBloc()
      : formKey = GlobalKey<FormState>(),
        super(const ProductFormState()) {
    on<NameFieldChangedEvent>(_onNameChanged);
    on<SkuFieldChangedEvent>(_onSkuChanged);
    on<CategoryFieldChangedEvent>(_onCategoryChanged);
    on<DescriptionFieldChangedEvent>(_onDescriptionChanged);
    on<PriceFieldChangedEvent>(_onPriceChanged);
    on<CostFieldChangedEvent>(_onCostChanged);
    on<QuantityFieldChangedEvent>(_onQuantityChanged);
    on<MainUnitFieldChangedEvent>(_onMainUnitChanged);
    on<CriticalLevelFieldChangedEvent>(_onCriticalLevelChanged);
    on<DeadstockFieldChangedEvent>(_onDeadStockChanged);
    on<FastMovingStockFieldChangedEvent>(_onFastMovingStockChanged);
    on<ProductStatusChangedEvent>(_onProductStatusChanged);
    on<FormButtonPressedEvent>(_onButtonPressed);
    on<FormResetEvent>(_onFormReset);
    on<FormSubmittedEvent>(_onFormSubmitted);
  }

  void _onNameChanged(NameFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String name = event.name;
    return emit(state.copyWith(name: name));
  }

  void _onSkuChanged(SkuFieldChangedEvent event, Emitter<ProductFormState> emit) {
    final String sku = event.sku;
    return emit(state.copyWith(sku: sku));
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

  void _onButtonPressed(FormButtonPressedEvent event, Emitter<ProductFormState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.validating));
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      emit(state.copyWith(formStatus: FormStatus.submitting));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(formStatus: FormStatus.invalid));
    }
  }

  FutureOr<void> _onFormReset(FormResetEvent event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(
      name: '',
      sku: '',
      category: '',
      description: '',
      price: '',
      cost: '',
      quantity: '',
      mainUnit: '',
      criticalLevel: '',
      deadstockTreshold: '',
      fastmovingTreshold: '',
    ));
  }

  void _onFormSubmitted(FormSubmittedEvent event, Emitter emit) {
    emit(state.copyWith(formStatus: FormStatus.valid));
  }
}
