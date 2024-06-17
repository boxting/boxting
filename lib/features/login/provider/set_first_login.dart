import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_first_login.g.dart';

@riverpod
FutureOr<void> setFirstLogin(SetFirstLoginRef ref) async {
  final _repository = ref.read(authRepositoryProvider);
  await _repository.saveFirstTimeLogin();
}
