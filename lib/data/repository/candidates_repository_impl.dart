import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:dio/dio.dart';

class CandidatesRepositoryImpl extends CandidatesRepository {

  CandidatesRepositoryImpl(this.client);
  final BoxtingClient client;
  @override
  Future<CandidatesResponse> fetchCandidatesByElection(String election) async {
    try {
      final result = await client.fetchCandidatesByElection(election);
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<SingleCandidateResponse> fetchCandidateById(
    String listId,
    String candidateId,
  ) async {
    try {
      final result = await client.fetchCandidateById(candidateId, listId);
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }
}
