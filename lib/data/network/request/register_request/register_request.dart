import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {

  RegisterRequest({
    this.username = '',
    this.password = '',
    this.mail = '',
    this.voter,
  });
  String username;
  String password;
  String mail;
  VoterRequest? voter;

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class VoterRequest {

  VoterRequest({
    required this.firstName,
    required this.lastName,
    required this.dni,
    required this.phone,
  });

  factory VoterRequest.fromJson(Map<String, dynamic> json) =>
      _$VoterRequestFromJson(json);
  String firstName;
  String lastName;
  String dni;
  String phone;
  Map<String, dynamic> toJson() => _$VoterRequestToJson(this);
}
