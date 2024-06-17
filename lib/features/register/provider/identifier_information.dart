import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'identifier_information.g.dart';

@riverpod
FutureOr<DniResponseData> identifierInformation(
  IdentifierInformationRef ref,
  String dni,
) async {
  final _repository = ref.watch(authRepositoryProvider);
  return await _repository.fetchInformationFromReniec(dni);
}
