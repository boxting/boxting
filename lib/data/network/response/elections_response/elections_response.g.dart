// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectionsResponse _$ElectionsResponseFromJson(Map<String, dynamic> json) =>
    ElectionsResponse(
      success: json['success'] as bool,
      data: ElectionResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElectionsResponseToJson(ElectionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

SingleElectionResponse _$SingleElectionResponseFromJson(
        Map<String, dynamic> json) =>
    SingleElectionResponse(
      success: json['success'] as bool,
      data: ElectionElementResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleElectionResponseToJson(
        SingleElectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ElectionResponseData _$ElectionResponseDataFromJson(
        Map<String, dynamic> json) =>
    ElectionResponseData(
      json['eventStatus'] as num,
      (json['elements'] as List<dynamic>)
          .map((e) =>
              ElectionElementResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectionResponseDataToJson(
        ElectionResponseData instance) =>
    <String, dynamic>{
      'eventStatus': instance.eventStatus,
      'elements': instance.elements,
    };

ElectionElementResponseData _$ElectionElementResponseDataFromJson(
        Map<String, dynamic> json) =>
    ElectionElementResponseData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      information: json['information'] as String,
      winners: (json['winners'] as num).toInt(),
      eventId: (json['eventId'] as num).toInt(),
      typeId: (json['typeId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      userVoted: json['userVoted'] as bool,
    );

Map<String, dynamic> _$ElectionElementResponseDataToJson(
        ElectionElementResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'information': instance.information,
      'winners': instance.winners,
      'eventId': instance.eventId,
      'typeId': instance.typeId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'userVoted': instance.userVoted,
    };
