import 'package:easthardware_pms/domain/models/security_question.dart';

abstract class SecurityQuestionRepository {
  Future<List<SecurityQuestion>> getAllSecurityQuestions();
  Future<SecurityQuestion?> getSecurityQuestionById(int id);
  Future<SecurityQuestion> addSecurityQuestion(SecurityQuestion securityQuestion);
  Future<SecurityQuestion> updateSecurityQuestion(SecurityQuestion securityQuestion);
  Future<void> deleteSecurityQuestion(int id);
  Future<List<SecurityQuestion>> getSecurityQuestionsByUserId(int userId);
}
