part of 'product_form_bloc.dart';

enum FormStatus { initial, validating, submitting, valid, invalid }

class ProductFormState extends Equatable {
  // Data Entity attributes
  final String name;
  final String sku; // Stock Keeping Unit (SKU)
  final String category;
  final String? description;
  final String price;
  final String cost;
  final String quantity;
  final String mainUnit;
  final String criticalLevel;
  final String deadstockTreshold;
  final String fastmovingTreshold;
  final String date;
  final String productStatus;
  final String user;

  // Form attributes
  final String? nameErrorMessage;
  final String? skuErrorMessage;
  final String? categoryErrorMessage;
  final String? priceErrorMessage;
  final String? costErrorMessage;
  final String? quantityErrorMessage;
  final String? deadstockErrorMessage;
  final String? fastStockErrorMessage;
  final FormStatus formStatus;

  const ProductFormState({
    this.name = '',
    this.sku = '',
    this.category = '',
    this.description,
    this.price = '',
    this.cost = '',
    this.quantity = '',
    this.mainUnit = '',
    this.criticalLevel = '',
    this.deadstockTreshold = '',
    this.fastmovingTreshold = '',
    this.date = '',
    this.user = '',
    this.productStatus = '',
    this.nameErrorMessage,
    this.skuErrorMessage,
    this.categoryErrorMessage,
    this.priceErrorMessage,
    this.costErrorMessage,
    this.quantityErrorMessage,
    this.deadstockErrorMessage,
    this.fastStockErrorMessage,
    this.formStatus = FormStatus.initial,
  });

  ProductFormState copyWith({
    String? name,
    String? sku,
    String? category,
    String? description,
    String? price,
    String? cost,
    String? quantity,
    String? mainUnit,
    String? criticalLevel,
    String? deadstockTreshold,
    String? fastmovingTreshold,
    String? date,
    String? productStatus,
    String? user,
    String? nameErrorMessage,
    String? skuErrorMessage,
    String? categoryErrorMessage,
    String? priceErrorMessage,
    String? costErrorMessage,
    String? quantityErrorMessage,
    String? deadstockErrorMessage,
    String? fastStockErrorMessage,
    FormStatus? formStatus,
  }) {
    return ProductFormState(
      name: name ?? this.name,
      sku: sku ?? this.sku,
      category: category ?? this.category,
      description: description ?? this.description,
      price: price ?? this.price,
      cost: cost ?? this.cost,
      quantity: quantity ?? this.quantity,
      mainUnit: mainUnit ?? this.mainUnit,
      criticalLevel: criticalLevel ?? this.criticalLevel,
      deadstockTreshold: deadstockTreshold ?? this.deadstockTreshold,
      fastmovingTreshold: fastmovingTreshold ?? this.fastmovingTreshold,
      date: date ?? this.date,
      productStatus: productStatus ?? this.productStatus,
      user: user ?? this.user,
      nameErrorMessage: nameErrorMessage ?? this.nameErrorMessage,
      skuErrorMessage: skuErrorMessage ?? this.skuErrorMessage,
      categoryErrorMessage: categoryErrorMessage ?? this.categoryErrorMessage,
      priceErrorMessage: priceErrorMessage ?? this.priceErrorMessage,
      costErrorMessage: costErrorMessage ?? this.costErrorMessage,
      quantityErrorMessage: quantityErrorMessage ?? this.quantityErrorMessage,
      deadstockErrorMessage: deadstockErrorMessage ?? this.deadstockErrorMessage,
      fastStockErrorMessage: fastStockErrorMessage ?? this.fastStockErrorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  @override
  List<Object?> get props => [
        name,
        sku,
        category,
        description,
        price,
        cost,
        quantity,
        mainUnit,
        criticalLevel,
        deadstockTreshold,
        fastmovingTreshold,
        date,
        productStatus,
        user,
        nameErrorMessage,
        skuErrorMessage,
        categoryErrorMessage,
        priceErrorMessage,
        costErrorMessage,
        quantityErrorMessage,
        deadstockErrorMessage,
        fastStockErrorMessage,
        formStatus,
      ];
}
