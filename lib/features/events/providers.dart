import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchEventByIdProvider = FutureProvider.autoDispose
    .family<EventResponseData, String>((ref, id) async {
  try {
    final repository = ref.watch(eventsRepositoryProvider);
    final result = await repository.fetchEventById(id);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

final removeUserFromEventProvider =
    FutureProvider.autoDispose.family<void, String>((ref, id) async {
  try {
    final repository = ref.watch(eventsRepositoryProvider);
    await repository.unsubscribeVoterFromEvent(id);
    await ref.container.refresh(fetchUserEventsProvider);
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

final addNewEventProvider = FutureProvider.autoDispose
    .family<void, SubscribeEventRequest>((ref, request) async {
  try {
    final repository = ref.watch(eventsRepositoryProvider);
    await repository.subscribeNewEvent(request);
    await ref.container.refresh(fetchUserEventsProvider);
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

final fetchUserEventsProvider =
    FutureProvider<List<EventResponseData>>((ref) async {
  try {
    final repository = ref.watch(eventsRepositoryProvider);
    final result = await repository.fetchEvents();
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});
