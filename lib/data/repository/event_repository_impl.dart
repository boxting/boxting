import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:dio/dio.dart';
import 'utils.dart';

class EventRepositoryImpl extends EventRepository {
  final BoxtingClient boxtingClient;

  EventRepositoryImpl(this.boxtingClient);
  @override
  Future<bool> subscribeNewEvent(SubscribeEventRequest request) async {
    try {
      final result = await boxtingClient.subscribeNewEvent(request);
      return result.success;
    } on DioError catch (e) {
      final code =
          int.parse(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }
}
