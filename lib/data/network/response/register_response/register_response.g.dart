// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : RegisterResponseData.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

RegisterResponseData _$RegisterResponseDataFromJson(Map<String, dynamic> json) {
  return RegisterResponseData(
    isActive: json['isActive'] as bool,
    id: json['id'] as int,
    username: json['username'] as String,
    updatedAt: json['updatedAt'] as String,
    createdAt: json['createdAt'] as String,
    voter: json['voter'] == null
        ? null
        : RegisterResponseVoter.fromJson(json['voter'] as Map<String, dynamic>),
    mail: json['mail'] as String,
  );
}

Map<String, dynamic> _$RegisterResponseDataToJson(
        RegisterResponseData instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'id': instance.id,
      'username': instance.username,
      'mail': instance.mail,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'voter': instance.voter,
    };

RegisterResponseVoter _$RegisterResponseVoterFromJson(
    Map<String, dynamic> json) {
  return RegisterResponseVoter(
    id: json['id'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    dni: json['dni'] as String,
    phone: json['phone'] as String,
    userId: json['userId'] as int,
    updatedAt: json['updatedAt'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$RegisterResponseVoterToJson(
        RegisterResponseVoter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dni': instance.dni,
      'phone': instance.phone,
      'userId': instance.userId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
