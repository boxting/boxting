abstract class LoginRepository {
  Future<bool> login(String username, String password);
  Future<bool> isFirstTimeLogin();
}
