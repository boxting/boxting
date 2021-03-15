// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatesResponse _$CandidatesResponseFromJson(Map<String, dynamic> json) {
  return CandidatesResponse(
    json['success'] as bool,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CandidateResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CandidatesResponseToJson(CandidatesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

SingleCandidateResponse _$SingleCandidateResponseFromJson(
    Map<String, dynamic> json) {
  return SingleCandidateResponse(
    json['success'] as bool,
    json['data'] == null
        ? null
        : CandidateResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleCandidateResponseToJson(
        SingleCandidateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

CandidateResponseData _$CandidateResponseDataFromJson(
    Map<String, dynamic> json) {
  return CandidateResponseData(
    id: json['id'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    information: json['information'] as String,
    age: json['age'] as int,
    isActive: json['isActive'] as bool,
    listId: json['listId'] as int,
    electionId: json['electionId'] as int,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    imageUrl: json['imageUrl'] as String,
    list: json['list'] == null
        ? null
        : ElectionList.fromJson(json['list'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CandidateResponseDataToJson(
        CandidateResponseData instance) =>
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

ElectionList _$ElectionListFromJson(Map<String, dynamic> json) {
  return ElectionList(
    id: json['id'] as int,
    name: json['name'] as String,
    information: json['information'] as String,
    electionId: json['electionId'] as int,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$ElectionListToJson(ElectionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'information': instance.information,
      'electionId': instance.electionId,
      'imageUrl': instance.imageUrl,
    };
