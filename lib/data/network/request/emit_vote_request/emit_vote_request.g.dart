// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emit_vote_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmitVoteRequest _$EmitVoteRequestFromJson(Map<String, dynamic> json) =>
    EmitVoteRequest(
      (json['candidates'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EmitVoteRequestToJson(EmitVoteRequest instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
