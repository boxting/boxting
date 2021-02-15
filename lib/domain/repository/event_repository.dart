import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';

abstract class EventRepository {
  Future<bool> subscribeNewEvent(SubscribeEventRequest request);
}
