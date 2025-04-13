part of 'category_form_bloc.dart';

class CategoryFormState extends Equatable {
  final String category;
  const CategoryFormState({
    this.category = '',
  });

  CategoryFormState copyWith({
    String? category,
  }) {
    return CategoryFormState(
      category: category ?? this.category,
    );
  }

  @override
  List<Object> get props => [];
}

final class CategoryFormInitial extends CategoryFormState {
  const CategoryFormInitial({
    super.category = '',
  });
}
