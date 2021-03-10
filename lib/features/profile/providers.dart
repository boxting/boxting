import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userInfoProvider = FutureProvider<User>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  final result = await repository.getUserInformation();
  return result.data.toUser();
});
