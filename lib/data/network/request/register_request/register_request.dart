import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String username;
  String password;
  String mail;
  VoterRequest? voter;

  RegisterRequest({
    this.username = '',
    this.password = '',
    this.mail = '',
    this.voter,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class VoterRequest {
  String firstName;
  String lastName;
  String dni;
  String phone;

  VoterRequest({
    required this.firstName,
    required this.lastName,
    required this.dni,
    required this.phone,
  });

  factory VoterRequest.fromJson(Map<String, dynamic> json) =>
      _$VoterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VoterRequestToJson(this);
}
