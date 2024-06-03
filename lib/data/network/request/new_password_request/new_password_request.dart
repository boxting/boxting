import 'package:json_annotation/json_annotation.dart';

part 'new_password_request.g.dart';

@JsonSerializable()
class NewPasswordRequest {
  final String mail;
  final String token;
  final String newPassword;

  NewPasswordRequest({
    required this.mail,
    required this.token,
    required this.newPassword,
  });
  Map<String, dynamic> toJson() => _$NewPasswordRequestToJson(this);
}
