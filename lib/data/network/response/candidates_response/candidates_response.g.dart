// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatesResponse _$CandidatesResponseFromJson(Map<String, dynamic> json) =>
    CandidatesResponse(
      json['success'] as bool,
      CandidateResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CandidatesResponseToJson(CandidatesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

SingleCandidateResponse _$SingleCandidateResponseFromJson(
        Map<String, dynamic> json) =>
    SingleCandidateResponse(
      json['success'] as bool,
      CandidateElementResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleCandidateResponseToJson(
        SingleCandidateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

CandidateResponseData _$CandidateResponseDataFromJson(
        Map<String, dynamic> json) =>
    CandidateResponseData(
      json['eventStatus'] as num,
      (json['elements'] as List<dynamic>)
          .map((e) =>
              CandidateElementResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CandidateResponseDataToJson(
        CandidateResponseData instance) =>
    <String, dynamic>{
      'eventStatus': instance.eventStatus,
      'elements': instance.elements,
    };

CandidateElementResponseData _$CandidateElementResponseDataFromJson(
        Map<String, dynamic> json) =>
    CandidateElementResponseData(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      information: json['information'] as String,
      age: (json['age'] as num).toInt(),
      isActive: json['isActive'] as bool,
      listId: (json['listId'] as num).toInt(),
      electionId: (json['electionId'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      list: ElectionList.fromJson(json['list'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String? ?? notAvailableImage,
    );

Map<String, dynamic> _$CandidateElementResponseDataToJson(
        CandidateElementResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'information': instance.information,
      'age': instance.age,
      'isActive': instance.isActive,
      'listId': instance.listId,
      'imageUrl': instance.imageUrl,
      'electionId': instance.electionId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'list': instance.list,
    };

ElectionList _$ElectionListFromJson(Map<String, dynamic> json) => ElectionList(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      information: json['information'] as String,
      electionId: (json['electionId'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ElectionListToJson(ElectionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'information': instance.information,
      'electionId': instance.electionId,
      'imageUrl': instance.imageUrl,
    };
