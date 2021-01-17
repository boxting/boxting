import 'package:boxting/data/network/response/dni_response/dni_response.dart';

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

  Future<DniResponseData> fetchInformationFromReniec(String dni);
}
