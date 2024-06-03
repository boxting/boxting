// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['success'] as bool,
      UserResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) =>
    UserResponseData(
      (json['id'] as num).toInt(),
      json['username'] as String,
      json['mail'] as String,
      json['isActive'] as bool,
      RoleResponse.fromJson(json['role'] as Map<String, dynamic>),
      VoterResponse.fromJson(json['voter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseDataToJson(UserResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'mail': instance.mail,
      'isActive': instance.isActive,
      'role': instance.role,
      'voter': instance.voter,
    };

RoleResponse _$RoleResponseFromJson(Map<String, dynamic> json) => RoleResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$RoleResponseToJson(RoleResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

VoterResponse _$VoterResponseFromJson(Map<String, dynamic> json) =>
    VoterResponse(
      (json['id'] as num).toInt(),
      json['firstName'] as String,
      json['lastName'] as String,
      json['dni'] as String,
      json['phone'] as String,
      json['age'] as num,
      json['birthday'] as String,
    );

Map<String, dynamic> _$VoterResponseToJson(VoterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dni': instance.dni,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'age': instance.age,
    };
