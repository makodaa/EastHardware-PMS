part of 'category_list_bloc.dart';

class CategoryListState {
  final List<Category> categories;
  final DataStatus status;

  CategoryListState(this.categories, this.status);

  CategoryListState copyWith({
    List<Category>? categories,
    DataStatus? status,
  }) {
    return CategoryListState(
      categories ?? this.categories,
      status ?? this.status,
    );
  }
}

final class CategoryListInitial extends CategoryListState {
  CategoryListInitial() : super([], DataStatus.initial);
}
