abstract class RegisterRepository {
  Future<bool> registerUser(
    String name,
    String lastname,
    String dni,
    String phone,
    String email,
    String username,
    String password,
  );

  Future<void> fetchInformationFromReniec(String dni);
}
