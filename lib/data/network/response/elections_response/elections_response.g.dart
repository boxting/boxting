// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectionsResponse _$ElectionsResponseFromJson(Map<String, dynamic> json) {
  return ElectionsResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ElectionResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ElectionsResponseToJson(ElectionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

SingleElectionResponse _$SingleElectionResponseFromJson(
    Map<String, dynamic> json) {
  return SingleElectionResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : ElectionResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleElectionResponseToJson(
        SingleElectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ElectionResponseData _$ElectionResponseDataFromJson(Map<String, dynamic> json) {
  return ElectionResponseData(
    id: json['id'] as int,
    name: json['name'] as String,
    information: json['information'] as String,
    winners: json['winners'] as int,
    eventId: json['eventId'] as int,
    typeId: json['typeId'] as int,
    updatedAt: json['updatedAt'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$ElectionResponseDataToJson(
        ElectionResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'information': instance.information,
      'winners': instance.winners,
      'eventId': instance.eventId,
      'typeId': instance.typeId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
