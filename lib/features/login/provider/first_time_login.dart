import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_time_login.g.dart';

@riverpod
FutureOr<bool> firstTimeLogin(FirstTimeLoginRef ref) async {
  final _repository = ref.read(authRepositoryProvider);
  return await _repository.isFirstTimeLogin();
}
