import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_repository_impl.g.dart';

@riverpod
EventRepository eventRepository(EventRepositoryRef ref) {
  final boxtingClient = ref.read(boxtingClientProvider);
  return EventRepositoryImpl(boxtingClient);
}

class EventRepositoryImpl extends EventRepository {
  EventRepositoryImpl(this.boxtingClient);
  final BoxtingClient boxtingClient;

  @override
  Future<bool> subscribeNewEvent(SubscribeEventRequest request) async {
    try {
      final result = await boxtingClient.subscribeNewEvent(request);
      return result.success;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<EventsResponse> fetchEvents() async {
    try {
      final result = await boxtingClient.fetchEvents();
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<SingleEventResponse> fetchEventById(String id) async {
    try {
      final result = await boxtingClient.fetchEventById(id);
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<bool> unsubscribeVoterFromEvent(String eventId) async {
    try {
      final result = await boxtingClient.unsubscribeVoterFromEvent(eventId);
      return result.success;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }
}
