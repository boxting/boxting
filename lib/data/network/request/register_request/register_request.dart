import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String username;
  final String password;
  final String mail;
  final VoterRequest voter;

  RegisterRequest({this.username, this.password, this.voter, this.mail});

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class VoterRequest {
  final String firstName;
  final String lastName;
  final String dni;
  final String phone;

  VoterRequest({
    this.firstName,
    this.lastName,
    this.dni,
    this.phone,
  });

  factory VoterRequest.fromJson(Map<String, dynamic> json) =>
      _$VoterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VoterRequestToJson(this);
}
