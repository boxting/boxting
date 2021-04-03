import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultResponse {
  final bool success;
  final List<ResultResponseData> data;

  ResultResponse(this.success, this.data);

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);
}

@JsonSerializable()
class ResultResponseData {
  final String electionId;
  final String firstName;
  final String id;
  final String imageUrl;
  final String lastName;
  final String type;
  final num voteCount;

  ResultResponseData(
    this.electionId,
    this.firstName,
    this.id,
    this.imageUrl,
    this.lastName,
    this.type,
    this.voteCount,
  );

  factory ResultResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseDataFromJson(json);
}
