part of 'security_question_list_bloc.dart';

class SecurityQuestionListState extends Equatable {
  final List<SecurityQuestion> securityQuestions;
  final List<SecurityQuestion> filteredQuestions;
  final DataStatus status;

  const SecurityQuestionListState({
    this.securityQuestions = const [],
    this.filteredQuestions = const [],
    this.status = DataStatus.initial,
  });

  SecurityQuestionListState copyWith({
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestion>? filteredQuestions,
    DataStatus? status,
  }) {
    return SecurityQuestionListState(
      securityQuestions: securityQuestions ?? this.securityQuestions,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [securityQuestions, filteredQuestions, status];
}
