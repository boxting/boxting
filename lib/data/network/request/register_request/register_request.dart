import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String username;
  String password;
  String mail;
  VoterRequest voter;

  RegisterRequest({this.username, this.password, this.voter, this.mail}) {
    voter ??= VoterRequest();
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class VoterRequest {
  String firstName;
  String lastName;
  String dni;
  String phone;

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
