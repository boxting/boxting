import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsBloc extends ChangeNotifier {
  final EventRepository eventRepository;

  EventsBloc(this.eventRepository);

  Future<List<EventResponseData>> fetchEvents() async {
    try {
      final result = await eventRepository.fetchEvents();
      return result.data;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> subscribeEvent(String eventCode, String accessCode) async {
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

  Future<EventResponseData> fetchEventById(String id) async {
    try {
      final result = await eventRepository.fetchEventById(id);
      return result.data;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
