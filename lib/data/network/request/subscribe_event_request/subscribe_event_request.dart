import 'package:json_annotation/json_annotation.dart';
part 'subscribe_event_request.g.dart';

@JsonSerializable()
class SubscribeEventRequest {
  final String eventCode;
  final String accessCode;

  SubscribeEventRequest({required this.eventCode, required this.accessCode});
  Map<String, dynamic> toJson() => _$SubscribeEventRequestToJson(this);
}
