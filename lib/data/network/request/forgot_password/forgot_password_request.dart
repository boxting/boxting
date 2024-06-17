import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {

  ForgotPasswordRequest({required this.mail});
  final String mail;
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
