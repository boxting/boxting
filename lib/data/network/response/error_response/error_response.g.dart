// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      name: json['name'] as String,
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      errorCode: (json['errorCode'] as num).toInt(),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errorCode': instance.errorCode,
    };
