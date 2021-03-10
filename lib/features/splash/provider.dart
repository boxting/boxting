import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firstTimeOpenProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  await Future.delayed(Duration(seconds: 1));
  return await repository.isFirstTimeLogin();
});
