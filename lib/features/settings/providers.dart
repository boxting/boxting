import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';

final loadBiometricProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(biometricRepositoryProvider);
  return repository.isFingerprintLoginEnabled();
});

final setBioInformationProvider =
    FutureProvider.autoDispose.family<void, bool>((ref, info) async {
  final repository = ref.watch(biometricRepositoryProvider);
  await repository.setFingerprintLogin(info);
  await ref.container.refresh(loadBiometricProvider);
});

final packageProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.version} ${packageInfo.buildNumber}';
});
