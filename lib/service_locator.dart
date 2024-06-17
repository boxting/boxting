import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_locator.g.dart';

@riverpod
FlutterSecureStorage secureStorage(SecureStorageRef ref) {
  return FlutterSecureStorage();
}

@riverpod
LocalAuthentication localAuthentication(LocalAuthenticationRef ref) {
  return LocalAuthentication();
}

@riverpod
FirebaseRemoteConfig remoteConfig(RemoteConfigRef ref) {
  final remoteConfig = FirebaseRemoteConfig.instance;
  return remoteConfig;
}
