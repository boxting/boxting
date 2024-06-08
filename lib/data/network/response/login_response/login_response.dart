import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {

  LoginResponse({
    required this.success,
    this.data,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  final bool success;
  final LoginResponseData? data;
  final ErrorResponse? error;
}

@JsonSerializable()
class LoginResponseData {
  LoginResponseData({
    required this.id,
    required this.username,
    required this.role,
    required this.voter,
    required this.token,
    required this.mail,
    required this.refreshToken,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  final int id;
  final String username;
  final LoginResponseRole role;
  final LoginResponseVoter voter;
  final String mail;
  final String token;
  final String refreshToken;
}

@JsonSerializable()
class LoginResponseRole {
  LoginResponseRole({required this.name});

  factory LoginResponseRole.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseRoleFromJson(json);
  String name;
}

@JsonSerializable()
class LoginResponseVoter {

  LoginResponseVoter({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dni,
    required this.phone,
  });

  factory LoginResponseVoter.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseVoterFromJson(json);
  int id;
  String firstName;
  String lastName;
  String dni;

  String phone;
}
