import 'package:json_annotation/json_annotation.dart';

part 'validate_token_request.g.dart';

@JsonSerializable()
class ValidateTokenRequest {

  ValidateTokenRequest({required this.mail, required this.token});
  final String mail;
  final String token;
  Map<String, dynamic> toJson() => _$ValidateTokenRequestToJson(this);
}
