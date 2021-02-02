import 'package:json_annotation/json_annotation.dart';

part 'validate_token_request.g.dart';

@JsonSerializable()
class ValidateTokenRequest {
  final String mail;
  final String token;

  ValidateTokenRequest({this.mail, this.token});
  Map<String, dynamic> toJson() => _$ValidateTokenRequestToJson(this);
}
