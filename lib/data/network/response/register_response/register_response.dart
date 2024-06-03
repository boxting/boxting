import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final RegisterResponseData? data;
  final ErrorResponse? error;

  RegisterResponse({this.success = false, this.data, this.error});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class RegisterResponseData {
  final bool isActive;
  final int id;
  final String username;
  final String mail;
  final String updatedAt;
  final String createdAt;
  final RegisterResponseVoter voter;

  RegisterResponseData({
    required this.isActive,
    required this.id,
    required this.username,
    required this.updatedAt,
    required this.createdAt,
    required this.voter,
    required this.mail,
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
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dni,
    required this.phone,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory RegisterResponseVoter.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseVoterFromJson(json);
}
