abstract class ValidationService {
  bool isPasswordValid(String password);
  bool isUsernameValid(String username);
}

class ValidationServiceImpl extends ValidationService {
  //TODO: Implement the constraints for both
  @override
  bool isPasswordValid(String password) => false;
  @override
  bool isUsernameValid(String username) => false;
}
