import 'package:boxting/service_locator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_terms.g.dart';

@riverpod
FutureOr<String> fetchTerms(FetchTermsRef ref) async {
  final _remoteConfig = ref.watch(remoteConfigProvider);
  await _remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );
  return _remoteConfig.getString('terms');
}
