import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'elections_repository_impl.g.dart';

@riverpod
ElectionsRepository electionsRepository(ElectionsRepositoryRef ref) {
  final boxtingClient = ref.read(boxtingClientProvider);
  return ElectionsRepositoryImpl(boxtingClient);
}

class ElectionsRepositoryImpl extends ElectionsRepository {
  ElectionsRepositoryImpl(this.boxtingClient);
  final BoxtingClient boxtingClient;
  @override
  Future<ElectionsResponse> fetchElectionsByEvent(String eventId) async {
    try {
      final result = await boxtingClient.fetchElectionsFromEvent(eventId);
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<SingleElectionResponse> fetchElectionsById(
    String eventId,
    String electionId,
  ) async {
    try {
      final result = await boxtingClient.fetchElectionsById(
        eventId,
        electionId,
      );
      return result;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }
}
