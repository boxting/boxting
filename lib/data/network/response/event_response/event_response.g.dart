// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) {
  return EventResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : EventResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

EventResponseData _$EventResponseDataFromJson(Map<String, dynamic> json) {
  return EventResponseData(
    id: json['id'] as int,
    name: json['name'] as String,
    information: json['information'] as String,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    code: json['code'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$EventResponseDataToJson(EventResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'information': instance.information,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'code': instance.code,
      'updatedAt': instance.updatedAt,
    };