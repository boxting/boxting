import 'package:boxting/data/network/response/elections_response/elections_response.dart';

abstract class ElectionsRepository {
  Future<ElectionsResponse> fetchElectionsByEvent(String eventId);
}
