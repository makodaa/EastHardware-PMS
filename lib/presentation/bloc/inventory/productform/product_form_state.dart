part of 'product_form_bloc.dart';

class ProductFormState extends Equatable {
  // Data Entity attributes

  // Basic Product Information
  final String name;
  final String sku;

  // Form specific attribute to handle creation of new category
  final String categoryName;
  // Category ID that will be generated while submitting the form
  final int? categoryId;

  final String? description;
  final String price;
  final String cost;
  final String quantity;
  final String mainUnit;
  final String criticalLevel;

  // Form specific attribute to handle automated critical level creation
  final bool isCriticalLevelEdited;

  final String deadstockTreshold;
  final String fastmovingTreshold;

  // Product Secondary Units
  final List<FormUnit> secondaryUnits;

  // Product Creation Information, Hidden from Form
  final DateTime creationDate;
  final int? archiveStatus;
  final int? creatorId;

  // Temporary Solution to not use repositories
  final int? productId;

  final FormStatus formStatus;

  ProductFormState({
    this.name = '',
    String? sku,
    this.categoryName = '',
    this.categoryId,
    this.description,
    this.price = '',
    this.cost = '',
    this.quantity = '',
    this.mainUnit = '',
    List<FormUnit>? secondaryUnits,
    this.criticalLevel = '',
    this.isCriticalLevelEdited = false,
    String? deadstockTreshold,
    String? fastmovingTreshold,
    DateTime? creationDate,
    this.creatorId,
    this.productId,
    this.archiveStatus,
    this.formStatus = FormStatus.initial,
  })  : sku = const Uuid().v4().toString(),
        secondaryUnits = secondaryUnits ?? [FormUnit(name: '', factor: '')],
        creationDate = creationDate ?? DateTime.now(),
        deadstockTreshold = deadstockTreshold ?? DEFAULT_DEAD_STOCK_THRESHOLD.toString(),
        fastmovingTreshold = fastmovingTreshold ?? DEFAULT_FAST_MOVING_STOCK_THRESHOLD.toString();

  ProductFormState copyWith({
    String? name,
    String? sku,
    String? categoryName,
    int? categoryId,
    String? description,
    String? price,
    String? cost,
    String? quantity,
    String? mainUnit,
    List<FormUnit>? secondaryUnits,
    String? criticalLevel,
    bool? isCriticalLevelEdited,
    String? deadstockTreshold,
    String? fastmovingTreshold,
    DateTime? creationDate,
    int? archiveStatus,
    int? creatorId,
    FormStatus? formStatus,
    int? productId,
  }) {
    return ProductFormState(
      name: name ?? this.name,
      sku: sku ?? this.sku,
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      price: price ?? this.price,
      cost: cost ?? this.cost,
      quantity: quantity ?? this.quantity,
      mainUnit: mainUnit ?? this.mainUnit,
      secondaryUnits: secondaryUnits ?? this.secondaryUnits,
      criticalLevel: criticalLevel ?? this.criticalLevel,
      isCriticalLevelEdited: isCriticalLevelEdited ?? this.isCriticalLevelEdited,
      deadstockTreshold: deadstockTreshold ?? this.deadstockTreshold,
      fastmovingTreshold: fastmovingTreshold ?? this.fastmovingTreshold,
      creationDate: creationDate ?? this.creationDate,
      archiveStatus: archiveStatus ?? this.archiveStatus,
      creatorId: creatorId ?? this.creatorId,
      productId: productId ?? this.productId,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        name,
        sku,
        categoryName,
        categoryId,
        description,
        price,
        cost,
        quantity,
        mainUnit,
        secondaryUnits,
        criticalLevel,
        isCriticalLevelEdited,
        deadstockTreshold,
        fastmovingTreshold,
        creationDate,
        archiveStatus,
        creatorId,
        formStatus,
        productId,
      ];

  Product mapStateToProduct() {
    return Product(
      sku: sku,
      name: name,
      categoryId: categoryId,
      description: description,
      salePrice: double.parse(price),
      orderCost: double.parse(cost),
      quantity: double.parse(quantity),
      mainUnit: mainUnit,
      criticalLevel: double.parse(criticalLevel),
      deadStockThreshold: double.parse(deadstockTreshold),
      fastMovingStockThreshold: double.parse(deadstockTreshold),
      creationDate: creationDate.toIso8601String(),
      creatorId: creatorId!,
      archiveStatus: archiveStatus!,
    );
  }

  factory ProductFormState.fromProduct(Product product, List<Unit> units) {
    return ProductFormState(
      name: product.name,
      sku: product.sku,
      categoryId: product.categoryId,
      categoryName: product.categoryName!,
      description: product.description,
      price: product.salePrice.toString(),
      cost: product.orderCost.toString(),
      quantity: product.quantity.toString(),
      mainUnit: product.mainUnit,
      criticalLevel: product.criticalLevel.toString(),
      deadstockTreshold: product.deadStockThreshold.toString(),
      fastmovingTreshold: product.fastMovingStockThreshold.toString(),
      secondaryUnits:
          units.isEmpty ? [FormUnit(name: '', factor: '')] : units.map(FormUnit.fromUnit).toList(),
      creationDate: DateTime.parse(product.creationDate),
      creatorId: product.creatorId,
      archiveStatus: product.archiveStatus,
      productId: product.id!,
    );
  }
}

class ProductFormInitial extends ProductFormState {
  ProductFormInitial() : super();
}
