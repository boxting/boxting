import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final loadBiometricProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(biometricRepositoryProvider);
  return repository.isFingerprintLoginEnabled();
});

final setBioInformationProvider =
    FutureProvider.autoDispose.family<void, bool>((ref, info) async {
  final repository = ref.watch(biometricRepositoryProvider);
  await repository.setFingerprintLogin(enabled: info);
  ref.container.refresh(loadBiometricProvider);
});

final packageProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.version} ${packageInfo.buildNumber}';
});
