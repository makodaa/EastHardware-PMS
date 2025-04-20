import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:fluent_ui/fluent_ui.dart';

part 'category_form_state.dart';

class CategoryFormCubit extends Cubit<CategoryFormState> {
  final GlobalKey<FormState> formKey;
  CategoryFormCubit()
      : formKey = GlobalKey<FormState>(),
        super(const CategoryFormState());

  void onFormNameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void onButtonPressed() {
    emit(state.copyWith(status: FormStatus.validating));
    Future.delayed(Duration.zero);
    if (formKey.currentState case FormState formState when formState.validate()) {
      emit(state.copyWith(status: FormStatus.submitting));
      print(state.status.toString());
    }
  }

  void onSubmit() {
    emit(state.copyWith(status: FormStatus.submitted));
  }

  void onFormReset() {
    emit(const CategoryFormState());
  }
}
