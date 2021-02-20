// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeEventResponse _$SubscribeEventResponseFromJson(
    Map<String, dynamic> json) {
  return SubscribeEventResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : SubscribeEventResponseData.fromJson(
            json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SubscribeEventResponseToJson(
        SubscribeEventResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

SubscribeEventResponseData _$SubscribeEventResponseDataFromJson(
    Map<String, dynamic> json) {
  return SubscribeEventResponseData(
    isOwner: json['isOwner'] as bool,
    isCollaborator: json['isCollaborator'] as bool,
    userId: json['userId'] as num,
    eventId: json['eventId'] as num,
    accessCode: json['accessCode'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$SubscribeEventResponseDataToJson(
        SubscribeEventResponseData instance) =>
    <String, dynamic>{
      'isOwner': instance.isOwner,
      'isCollaborator': instance.isCollaborator,
      'userId': instance.userId,
      'eventId': instance.eventId,
      'accessCode': instance.accessCode,
      'updatedAt': instance.updatedAt,
    };
