import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';

abstract class EventRepository {
  Future<bool> subscribeNewEvent(SubscribeEventRequest request);
  Future<EventResponse> fetchEvents();
}
