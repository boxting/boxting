// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    LoginResponseData(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      role: LoginResponseRole.fromJson(json['role'] as Map<String, dynamic>),
      voter: LoginResponseVoter.fromJson(json['voter'] as Map<String, dynamic>),
      token: json['token'] as String,
      mail: json['mail'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'voter': instance.voter,
      'mail': instance.mail,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

LoginResponseRole _$LoginResponseRoleFromJson(Map<String, dynamic> json) =>
    LoginResponseRole(
      name: json['name'] as String,
    );

Map<String, dynamic> _$LoginResponseRoleToJson(LoginResponseRole instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

LoginResponseVoter _$LoginResponseVoterFromJson(Map<String, dynamic> json) =>
    LoginResponseVoter(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dni: json['dni'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$LoginResponseVoterToJson(LoginResponseVoter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dni': instance.dni,
      'phone': instance.phone,
    };
