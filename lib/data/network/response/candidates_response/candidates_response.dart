import 'package:json_annotation/json_annotation.dart';
part 'candidates_response.g.dart';

@JsonSerializable()
class CandidatesResponse {
  final bool success;
  final CandidateResponseData data;

  CandidatesResponse(this.success, this.data);

  factory CandidatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidatesResponseFromJson(json);
}

@JsonSerializable()
class SingleCandidateResponse {
  final bool success;
  final CandidateElementResponseData data;

  SingleCandidateResponse(this.success, this.data);
  factory SingleCandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleCandidateResponseFromJson(json);
}

@JsonSerializable()
class CandidateResponseData {
  final num eventStatus;
  final List<CandidateElementResponseData> elements;

  CandidateResponseData(this.eventStatus, this.elements);

  factory CandidateResponseData.fromJson(Map<String, dynamic> json) =>
      _$CandidateResponseDataFromJson(json);
}

@JsonSerializable()
class CandidateElementResponseData {
  final int id;
  final String firstName;
  final String lastName;
  final String information;
  final int age;
  final bool isActive;
  final int listId;
  final String imageUrl;
  final int electionId;
  final String createdAt;
  final String updatedAt;
  final ElectionList list;

  CandidateElementResponseData({
    this.id,
    this.firstName,
    this.lastName,
    this.information,
    this.age,
    this.isActive,
    this.listId,
    this.electionId,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.list,
  });

  factory CandidateElementResponseData.fromJson(Map<String, dynamic> json) =>
      _$CandidateElementResponseDataFromJson(json);
}

@JsonSerializable()
class ElectionList {
  final int id;
  final String name;
  final String information;
  final int electionId;
  final String imageUrl;

  ElectionList({
    this.id,
    this.name,
    this.information,
    this.electionId,
    this.imageUrl,
  });

  factory ElectionList.fromJson(Map<String, dynamic> json) =>
      _$ElectionListFromJson(json);
}
