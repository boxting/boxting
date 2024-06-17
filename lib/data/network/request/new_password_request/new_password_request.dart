import 'package:json_annotation/json_annotation.dart';

part 'new_password_request.g.dart';

@JsonSerializable()
class NewPasswordRequest {

  NewPasswordRequest({
    required this.mail,
    required this.token,
    required this.newPassword,
  });
  final String mail;
  final String token;
  final String newPassword;
  Map<String, dynamic> toJson() => _$NewPasswordRequestToJson(this);
}
