import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {

  LoginRequest({required this.username, required this.password});
  final String username;
  final String password;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
