// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dni_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DniResponse _$DniResponseFromJson(Map<String, dynamic> json) => DniResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : DniResponseData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DniResponseToJson(DniResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DniResponseData _$DniResponseDataFromJson(Map<String, dynamic> json) =>
    DniResponseData(
      dni: json['dni'] as String,
      cui: (json['cui'] as num).toInt(),
      motherLastname: json['apellido_materno'] as String,
      fatherLastname: json['apellido_paterno'] as String,
      names: json['nombres'] as String,
      used: json['used'] as bool,
    );

Map<String, dynamic> _$DniResponseDataToJson(DniResponseData instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'cui': instance.cui,
      'apellido_materno': instance.motherLastname,
      'apellido_paterno': instance.fatherLastname,
      'nombres': instance.names,
      'used': instance.used,
    };
