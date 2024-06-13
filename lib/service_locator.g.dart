// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_locator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$secureStorageHash() => r'6c445c8367485206f42e1a7d985a619f1cd0ef6d';

/// See also [secureStorage].
@ProviderFor(secureStorage)
final secureStorageProvider =
    AutoDisposeProvider<FlutterSecureStorage>.internal(
  secureStorage,
  name: r'secureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecureStorageRef = AutoDisposeProviderRef<FlutterSecureStorage>;
String _$localAuthenticationHash() =>
    r'5e9ea74a7bbe9b7bd1d6bbb7de8b0bdbf081ab55';

/// See also [localAuthentication].
@ProviderFor(localAuthentication)
final localAuthenticationProvider =
    AutoDisposeProvider<LocalAuthentication>.internal(
  localAuthentication,
  name: r'localAuthenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAuthenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalAuthenticationRef = AutoDisposeProviderRef<LocalAuthentication>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
