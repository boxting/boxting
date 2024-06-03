import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;
  final LoginResponseData? data;
  final ErrorResponse? error;

  LoginResponse({
    required this.success,
    this.data,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
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

  final int id;
  final String username;
  final LoginResponseRole role;
  final LoginResponseVoter voter;
  final String mail;
  final String token;
  final String refreshToken;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
}

@JsonSerializable()
class LoginResponseRole {
  String name;
  LoginResponseRole({required this.name});

  factory LoginResponseRole.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseRoleFromJson(json);
}

@JsonSerializable()
class LoginResponseVoter {
  int id;
  String firstName;
  String lastName;
  String dni;

  String phone;

  LoginResponseVoter({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dni,
    required this.phone,
  });

  factory LoginResponseVoter.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseVoterFromJson(json);
}
