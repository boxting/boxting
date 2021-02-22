import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsBloc extends ChangeNotifier {
  final EventRepository eventRepository;

  EventsBloc(this.eventRepository);

  List<EventResponseData> _events;

  List<EventResponseData> get events => _events;

  Future<void> fetchEvents() async {
    try {
      final result = await eventRepository.fetchEvents();
      _events = result.data;
    } on BoxtingException catch (e) {
      _events = [];
      throw Exception(e.message);
    }
    notifyListeners();
  }

  Future<void> subscribeEvent(String eventCode, String accessCode) async {
    try {
      final request = SubscribeEventRequest(
        accessCode: accessCode,
        eventCode: eventCode,
      );
      await eventRepository.subscribeNewEvent(request);
      await fetchEvents();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<EventResponseData> fetchEventById(String eventId) async {
    try {
      final result = await eventRepository.fetchEventById(eventId);
      return result.data;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> unsubscribeFromEvent(String eventId) async {
    try {
      await eventRepository.unsubscribeVoterFromEvent(eventId);
      await fetchEvents();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
