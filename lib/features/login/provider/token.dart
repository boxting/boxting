import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/service_locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token.g.dart';

@riverpod
Future<String?> token(TokenRef ref) async {
  final secureStorage = ref.read(secureStorageProvider);
  return await secureStorage.read(key: Constants.authToken);
}
