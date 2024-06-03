import 'package:json_annotation/json_annotation.dart';

part 'validate_token_request.g.dart';

@JsonSerializable()
class ValidateTokenRequest {
  final String mail;
  final String token;

  ValidateTokenRequest({required this.mail, required this.token});
  Map<String, dynamic> toJson() => _$ValidateTokenRequestToJson(this);
}
