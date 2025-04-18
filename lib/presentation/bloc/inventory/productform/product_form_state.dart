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

  // Product Alternative Units
  final List<FormUnit> alternativeUnits;

  // Product Creation Information, Hidden from Form
  final DateTime creationDate;
  final int archiveStatus;
  final int creatorId;

  // Temporary Solution to not use repositories
  final int productId;

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
    List<FormUnit>? alternativeUnits,
    this.criticalLevel = '',
    this.isCriticalLevelEdited = false,
    String? deadstockTreshold,
    String? fastmovingTreshold,
    DateTime? creationDate,
    required this.creatorId,
    this.productId = 0,
    this.archiveStatus = 0,
    this.formStatus = FormStatus.initial,
  })  : sku = const Uuid().v4().toString(),
        alternativeUnits = alternativeUnits ?? [FormUnit(name: '', factor: '')],
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
    List<FormUnit>? alternativeUnits,
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
      alternativeUnits: alternativeUnits ?? this.alternativeUnits,
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
        alternativeUnits,
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
      category: categoryId,
      description: description,
      salePrice: double.parse(price),
      orderCost: double.parse(cost),
      quantity: double.parse(quantity),
      mainUnit: mainUnit,
      criticalLevel: double.parse(criticalLevel),
      deadStockThreshold: double.parse(deadstockTreshold),
      fastMovingStockThreshold: double.parse(deadstockTreshold),
      creationDate: creationDate.toIso8601String(),
      creatorId: creatorId,
      archiveStatus: 0,
    );
  }
}

class ProductFormInitial extends ProductFormState {
  ProductFormInitial({required super.creatorId}) : super();
}
