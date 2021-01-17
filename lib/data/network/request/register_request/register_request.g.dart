// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return RegisterRequest(
    username: json['username'] as String,
    password: json['password'] as String,
    voter: json['voter'] == null
        ? null
        : VoterRequest.fromJson(json['voter'] as Map<String, dynamic>),
    mail: json['mail'] as String,
  );
}

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'mail': instance.mail,
      'voter': instance.voter,
    };

VoterRequest _$VoterRequestFromJson(Map<String, dynamic> json) {
  return VoterRequest(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    dni: json['dni'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$VoterRequestToJson(VoterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dni': instance.dni,
      'phone': instance.phone,
    };
