import 'package:json_annotation/json_annotation.dart';
part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  final bool success;
  final List<EventResponseData> data;

  EventResponse({this.success, this.data});
  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
}

@JsonSerializable()
class EventResponseData {
  final int id;
  final String name;
  final String information;
  final String startDate;
  final String endDate;
  final String code;
  final String updatedAt;

  EventResponseData({
    this.id,
    this.name,
    this.information,
    this.startDate,
    this.endDate,
    this.code,
    this.updatedAt,
  });

  factory EventResponseData.fromJson(Map<String, dynamic> json) =>
      _$EventResponseDataFromJson(json);
}
