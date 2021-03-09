import 'package:boxting/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final bool success;
  final UserResponseData data;

  UserResponse(this.success, this.data);
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@JsonSerializable()
class UserResponseData {
  final int id;
  final String username;
  final String mail;
  final bool isActive;
  final RoleResponse role;
  final VoterResponse voter;

  UserResponseData(
    this.id,
    this.username,
    this.mail,
    this.isActive,
    this.role,
    this.voter,
  );

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDataFromJson(json);
}

extension XUserResponseData on UserResponseData {
  User toUser() => User(
        id: id.toString(),
        name: voter.firstName,
        lastname: voter.lastName,
        dni: voter.dni,
        mail: mail,
        phone: voter.phone,
      );
}

@JsonSerializable()
class RoleResponse {
  final String name;

  RoleResponse(this.name);

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);
}

@JsonSerializable()
class VoterResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String dni;
  final String phone;

  VoterResponse(this.id, this.firstName, this.lastName, this.dni, this.phone);

  factory VoterResponse.fromJson(Map<String, dynamic> json) =>
      _$VoterResponseFromJson(json);
}
