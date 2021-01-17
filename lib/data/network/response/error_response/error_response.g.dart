// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    name: json['name'] as String,
    message: json['message'] as String,
    statusCode: json['statusCode'] as int,
    errorCode: json['errorCode'] as int,
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errorCode': instance.errorCode,
    };
