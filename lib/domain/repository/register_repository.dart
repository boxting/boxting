abstract class RegisterRepository {
  Future<bool> registerUser(String dni, String phone, String email);
}
