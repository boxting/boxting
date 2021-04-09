import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getElectionResultProvider = FutureProvider.autoDispose
    .family<ResultResponseData, String>((ref, election) async {
  try {
    final repository = ref.watch(votingRepositoryProvider);
    final result = await repository.getResultByElection(election);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});
