class SecurityQuestion {
  final int? id;
  final int userId;
  final String question;
  final String answer;

  SecurityQuestion({
    this.id,
    required this.userId,
    required this.question,
    required this.answer,
  });

  factory SecurityQuestion.fromMap(Map<String, dynamic> map) {
    return SecurityQuestion(
      id: map['id'],
      userId: map['user_id'],
      question: map['question'],
      answer: map['answer'],
    );
  }

  SecurityQuestion copyWith({
    int? id,
    int? userId,
    String? question,
    String? answer,
  }) {
    return SecurityQuestion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'question': question,
      'answer': answer,
    };
  }
}
