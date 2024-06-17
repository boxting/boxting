import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse(this.success, this.data);
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  final bool success;
  final UserResponseData data;
}

@JsonSerializable()
class UserResponseData {
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
  final int id;
  final String username;
  final String mail;
  final bool isActive;
  final RoleResponse role;
  final VoterResponse voter;
}

extension XUserResponseData on UserResponseData {
  User toUser() {
    final df = DateFormat(Constants.localDateFormat);
    String date;
    try {
      date = df.format(DateTime.parse(voter.birthday));
    } catch (_) {
      date = 'Fecha desconocida';
    }
    return User(
      id: id.toString(),
      name: voter.firstName,
      lastname: voter.lastName,
      dni: voter.dni,
      mail: mail,
      phone: voter.phone,
      birthday: date,
    );
  }
}

@JsonSerializable()
class RoleResponse {
  RoleResponse(this.name);

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);
  final String name;
}

@JsonSerializable()
class VoterResponse {
  VoterResponse(
    this.id,
    this.firstName,
    this.lastName,
    this.dni,
    this.phone,
    this.age,
    this.birthday,
  );

  factory VoterResponse.fromJson(Map<String, dynamic> json) =>
      _$VoterResponseFromJson(json);
  final int id;
  final String firstName;
  final String lastName;
  final String dni;
  final String phone;
  final String birthday;
  final num age;
}
