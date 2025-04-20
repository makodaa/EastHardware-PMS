part of 'category_form_cubit.dart';

class CategoryFormState extends Equatable {
  final String? name;
  final FormStatus status;
  const CategoryFormState({
    this.name = '',
    this.status = FormStatus.initial,
  });

  @override
  List<Object?> get props => [name, status];

  CategoryFormState copyWith({String? name, FormStatus? status}) {
    return CategoryFormState(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}
