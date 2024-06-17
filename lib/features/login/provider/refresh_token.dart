import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_token.g.dart';

@riverpod
FutureOr<void> refreshToken(RefreshTokenRef ref) async {
  final _authRepository = ref.read(authRepositoryProvider);
  await _authRepository.refreshToken();
}
