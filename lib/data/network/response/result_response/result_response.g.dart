// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse(
      success: json['success'] as bool,
      data: ResultResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ResultResponseData _$ResultResponseDataFromJson(Map<String, dynamic> json) =>
    ResultResponseData(
      json['totalVotes'] as num,
      ResultElectionResponse.fromJson(json['election'] as Map<String, dynamic>),
      (json['candidates'] as List<dynamic>)
          .map((e) =>
              ResultCandidateResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultResponseDataToJson(ResultResponseData instance) =>
    <String, dynamic>{
      'totalVotes': instance.totalVotes,
      'election': instance.election,
      'candidates': instance.candidates,
    };

ResultElectionResponse _$ResultElectionResponseFromJson(
        Map<String, dynamic> json) =>
    ResultElectionResponse(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ResultElectionResponseToJson(
        ResultElectionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ResultCandidateResponseData _$ResultCandidateResponseDataFromJson(
        Map<String, dynamic> json) =>
    ResultCandidateResponseData(
      json['electionId'] as String,
      json['firstName'] as String,
      json['id'] as String,
      json['imageUrl'] as String,
      json['lastName'] as String,
      json['type'] as String,
      json['voteCount'] as num,
    );

Map<String, dynamic> _$ResultCandidateResponseDataToJson(
        ResultCandidateResponseData instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'firstName': instance.firstName,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastName': instance.lastName,
      'type': instance.type,
      'voteCount': instance.voteCount,
    };
