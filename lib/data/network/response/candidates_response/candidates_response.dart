import 'package:json_annotation/json_annotation.dart';
part 'candidates_response.g.dart';

@JsonSerializable()
class CandidatesResponse {
  CandidatesResponse(this.success, this.data);

  factory CandidatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidatesResponseFromJson(json);
  final bool success;
  final CandidateResponseData data;
}

@JsonSerializable()
class SingleCandidateResponse {
  SingleCandidateResponse(this.success, this.data);
  factory SingleCandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleCandidateResponseFromJson(json);
  final bool success;
  final CandidateElementResponseData data;
}

@JsonSerializable()
class CandidateResponseData {
  CandidateResponseData(this.eventStatus, this.elements);

  factory CandidateResponseData.fromJson(Map<String, dynamic> json) =>
      _$CandidateResponseDataFromJson(json);
  final num eventStatus;
  final List<CandidateElementResponseData> elements;
}

const notAvailableImage =
    'https://corp.sellerscommerce.com//SCAssets/images/noimage.png';

@JsonSerializable()
class CandidateElementResponseData {
  CandidateElementResponseData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.information,
    required this.age,
    required this.isActive,
    required this.listId,
    required this.electionId,
    required this.createdAt,
    required this.updatedAt,
    required this.list,
    this.imageUrl = notAvailableImage,
  });

  factory CandidateElementResponseData.fromJson(Map<String, dynamic> json) =>
      _$CandidateElementResponseDataFromJson(json);
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
}

@JsonSerializable()
class ElectionList {
  ElectionList({
    required this.id,
    required this.name,
    required this.information,
    required this.electionId,
    required this.imageUrl,
  });

  factory ElectionList.fromJson(Map<String, dynamic> json) =>
      _$ElectionListFromJson(json);
  final int id;
  final String name;
  final String information;
  final int electionId;
  final String imageUrl;
}
