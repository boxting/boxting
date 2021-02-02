// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateTokenRequest _$ValidateTokenRequestFromJson(Map<String, dynamic> json) {
  return ValidateTokenRequest(
    mail: json['mail'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ValidateTokenRequestToJson(
        ValidateTokenRequest instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'token': instance.token,
    };
