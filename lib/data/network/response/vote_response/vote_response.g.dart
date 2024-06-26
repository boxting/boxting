// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteResponse _$VoteResponseFromJson(Map<String, dynamic> json) => VoteResponse(
      json['success'] as bool,
      VoteResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoteResponseToJson(VoteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

VoteResponseData _$VoteResponseDataFromJson(Map<String, dynamic> json) =>
    VoteResponseData(
      ResultElectionResponse.fromJson(json['election'] as Map<String, dynamic>),
      MyVoteResponse.fromJson(json['vote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoteResponseDataToJson(VoteResponseData instance) =>
    <String, dynamic>{
      'election': instance.election,
      'vote': instance.vote,
    };

MyVoteResponse _$MyVoteResponseFromJson(Map<String, dynamic> json) =>
    MyVoteResponse(
      json['id'] as String,
      json['electionId'] as String,
      json['type'] as String,
      json['voterId'] as String,
      (json['selectedCandidates'] as List<dynamic>)
          .map((e) =>
              SelectedCandidateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyVoteResponseToJson(MyVoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'electionId': instance.electionId,
      'type': instance.type,
      'voterId': instance.voterId,
      'selectedCandidates': instance.selectedCandidates,
    };

SelectedCandidateResponse _$SelectedCandidateResponseFromJson(
        Map<String, dynamic> json) =>
    SelectedCandidateResponse(
      json['firstName'] as String,
      json['imageUrl'] as String,
      json['lastName'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$SelectedCandidateResponseToJson(
        SelectedCandidateResponse instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'imageUrl': instance.imageUrl,
      'lastName': instance.lastName,
      'type': instance.type,
    };
