import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  final String mail;

  ForgotPasswordRequest({this.mail});
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
