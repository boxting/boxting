import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';

abstract class CandidatesRepository {
  Future<CandidatesResponse> fetchCandidatesByElection(String election);
  Future<SingleCandidateResponse> fetchCandidateById(
    String listId,
    String candidateId,
  );
}
