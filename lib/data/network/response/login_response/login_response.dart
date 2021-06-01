import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;
  final LoginResponseData data;
  final ErrorResponse error;

  LoginResponse({this.success, this.data, this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable(nullable: true)
class LoginResponseData {
  int id;
  String username;
  LoginResponseRole role;
  LoginResponseVoter voter;
  String mail;
  String token;
  String refreshToken;
  LoginResponseData({
    this.id,
    this.username,
    this.role,
    this.voter,
    this.token,
    this.mail,
    this.refreshToken,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
}

@JsonSerializable()
class LoginResponseRole {
  String name;
  LoginResponseRole({this.name});

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
    this.id,
    this.firstName,
    this.lastName,
    this.dni,
    this.phone,
  });

  factory LoginResponseVoter.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseVoterFromJson(json);
}
