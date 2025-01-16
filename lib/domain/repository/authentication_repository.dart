enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthenticationRepository {
  Future<void> logIn({required String username, required String password});
  void logOut();
  void dispose();
}
