import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({this.username, this.password});
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
