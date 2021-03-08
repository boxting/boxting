import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:dio/dio.dart';

class CandidatesRepositoryImpl extends CandidatesRepository {
  final BoxtingClient client;

  CandidatesRepositoryImpl(this.client);
  @override
  Future<CandidatesResponse> fetchCandidatesByElection(String election) async {
    try {
      final result = await client.fetchCandidatesByElection(election);
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
