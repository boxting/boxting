import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:dio/dio.dart';

class ElectionsRepositoryImpl extends ElectionsRepository {
  final BoxtingClient boxtingClient;

  ElectionsRepositoryImpl(this.boxtingClient);
  @override
  Future<ElectionsResponse> fetchElectionsByEvent(String eventId) async {
    try {
      final result = await boxtingClient.fetchElectionsFromEvent(eventId);
      return result;
    } on DioError catch (e) {
      final code = cast<int>(
        e.response.data[Constants.ERROR][Constants.ERROR_CODE],
      ).orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }
}
