import 'package:easthardware_pms/domain/models/security_question.dart';

class FormQuestion {
  final String question;
  final String answer;

  const FormQuestion({
    required this.question,
    required this.answer,
  });

  FormQuestion copyWith({
    String? question,
    String? answer,
  }) {
    return FormQuestion(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  SecurityQuestion toSecurityQuestion(int userId) {
    return SecurityQuestion(
      userId: userId,
      question: question,
      answer: answer,
    );
  }

  factory FormQuestion.fromSecurityQuestion(SecurityQuestion question) {
    return FormQuestion(
      question: question.question,
      answer: question.answer,
    );
  }
}
