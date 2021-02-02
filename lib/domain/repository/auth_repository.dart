import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';

abstract class AuthRepository {
  Future<bool> login(String username, String password);
  Future<bool> isFirstTimeLogin();
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
  Future<DefaultResponse> sendForgotPassword(String mail);
  Future<DefaultResponse> validatePasswordToken(String mail, String token);
  Future<DefaultResponse> setNewPassword(
    String mail,
    String token,
    String password,
  );
}
