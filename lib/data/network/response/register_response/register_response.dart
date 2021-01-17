import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final RegisterResponseData data;
  final ErrorResponse error;

  RegisterResponse({this.success, this.data, this.error});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable(nullable: true)
class RegisterResponseData {
  final bool isActive;
  final int id;
  final String username;
  final String mail;
  final String updatedAt;
  final String createdAt;
  final RegisterResponseVoter voter;

  RegisterResponseData({
    this.isActive,
    this.id,
    this.username,
    this.updatedAt,
    this.createdAt,
    this.voter,
    this.mail,
  });
  factory RegisterResponseData.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDataFromJson(json);
}

@JsonSerializable()
class RegisterResponseVoter {
  final int id;
  final String firstName;
  final String lastName;
  final String dni;
  final String phone;
  final int userId;
  final String updatedAt;
  final String createdAt;

  RegisterResponseVoter({
    this.id,
    this.firstName,
    this.lastName,
    this.dni,
    this.phone,
    this.userId,
    this.updatedAt,
    this.createdAt,
  });

  factory RegisterResponseVoter.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseVoterFromJson(json);
}
