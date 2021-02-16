import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsBloc extends ChangeNotifier {
  final EventRepository eventRepository;

  EventsBloc(this.eventRepository);

  Future<void> subsribeEvent(String eventCode, String accessCode) async {
    try {
      final request = SubscribeEventRequest(
        accessCode: accessCode,
        eventCode: eventCode,
      );
      return await eventRepository.subscribeNewEvent(request);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
