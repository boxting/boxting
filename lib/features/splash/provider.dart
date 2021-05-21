import 'package:boxting/service_locator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firstTimeOpenProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  final remoteConfig = await RemoteConfig.instance;
  await remoteConfig.fetch(expiration: const Duration(days: 1));
  await remoteConfig.activateFetched();
  // final version =
  await remoteConfig.getString('last_version');
  return await repository.isFirstTimeLogin();
});
