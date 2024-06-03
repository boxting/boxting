import 'package:boxting/service_locator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firstTimeOpenProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  // final version =
  remoteConfig.getString('last_version');
  return await repository.isFirstTimeLogin();
});
