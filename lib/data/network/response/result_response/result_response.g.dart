// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) {
  return ResultResponse(
    json['success'] as bool,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ResultResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ResultResponseData _$ResultResponseDataFromJson(Map<String, dynamic> json) {
  return ResultResponseData(
    json['electionId'] as String,
    json['firstName'] as String,
    json['id'] as String,
    json['imageUrl'] as String,
    json['lastName'] as String,
    json['type'] as String,
    json['voteCount'] as num,
  );
}

Map<String, dynamic> _$ResultResponseDataToJson(ResultResponseData instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'firstName': instance.firstName,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastName': instance.lastName,
      'type': instance.type,
      'voteCount': instance.voteCount,
    };
