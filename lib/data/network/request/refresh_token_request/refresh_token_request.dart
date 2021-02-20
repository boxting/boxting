import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable()
class RefreshTokenRequest {
  final String token;
  final String refreshToken;

  RefreshTokenRequest(this.token, this.refreshToken);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
