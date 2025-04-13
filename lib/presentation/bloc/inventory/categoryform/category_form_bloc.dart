import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_form_event.dart';
part 'category_form_state.dart';

class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  CategoryFormBloc() : super(const CategoryFormInitial()) {
    on<CategoryFormChanged>((event, emit) {
      final String category = event.category;
      emit(state.copyWith(category: category));
    });
  }
}
