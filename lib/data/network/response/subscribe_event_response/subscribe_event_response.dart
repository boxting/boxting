import 'package:json_annotation/json_annotation.dart';
part 'subscribe_event_response.g.dart';

@JsonSerializable()
class SubscribeEventResponse {
  final bool success;
  final SubscribeEventResponseData data;

  SubscribeEventResponse({this.success, this.data});
  factory SubscribeEventResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscribeEventResponseFromJson(json);
}

@JsonSerializable()
class SubscribeEventResponseData {
  final bool isOwner;
  final bool isCollaborator;
  final num userId;
  final num eventId;
  final String accessCode;
  final String updatedAt;

  SubscribeEventResponseData({
    this.isOwner,
    this.isCollaborator,
    this.userId,
    this.eventId,
    this.accessCode,
    this.updatedAt,
  });
  factory SubscribeEventResponseData.fromJson(Map<String, dynamic> json) =>
      _$SubscribeEventResponseDataFromJson(json);
}
