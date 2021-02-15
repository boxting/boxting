// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeEventRequest _$SubscribeEventRequestFromJson(
    Map<String, dynamic> json) {
  return SubscribeEventRequest(
    eventCode: json['eventCode'] as String,
    accessCode: json['accessCode'] as String,
  );
}

Map<String, dynamic> _$SubscribeEventRequestToJson(
        SubscribeEventRequest instance) =>
    <String, dynamic>{
      'eventCode': instance.eventCode,
      'accessCode': instance.accessCode,
    };
