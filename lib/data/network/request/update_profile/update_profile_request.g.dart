// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return UpdateProfileRequest(
    json['mail'] as String,
    json['phone'] as String,
    json['birthday'] as String,
  );
}

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'phone': instance.phone,
      'birthday': instance.birthday,
    };
