part of 'category_form_bloc.dart';

sealed class CategoryFormEvent extends Equatable {
  const CategoryFormEvent();

  @override
  List<Object> get props => [];
}

class CategoryFormChanged extends CategoryFormEvent {
  final String category;

  const CategoryFormChanged(this.category);
}
