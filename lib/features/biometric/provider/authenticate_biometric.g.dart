// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_biometric.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticateBiometricHash() =>
    r'7a440e5136058d7ce488a09a889cedd64bc20f8d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AuthenticateBiometric
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String reason;

  FutureOr<bool> build({
    String reason = '',
  });
}

/// See also [AuthenticateBiometric].
@ProviderFor(AuthenticateBiometric)
const authenticateBiometricProvider = AuthenticateBiometricFamily();

/// See also [AuthenticateBiometric].
class AuthenticateBiometricFamily extends Family<AsyncValue<bool>> {
  /// See also [AuthenticateBiometric].
  const AuthenticateBiometricFamily();

  /// See also [AuthenticateBiometric].
  AuthenticateBiometricProvider call({
    String reason = '',
  }) {
    return AuthenticateBiometricProvider(
      reason: reason,
    );
  }

  @override
  AuthenticateBiometricProvider getProviderOverride(
    covariant AuthenticateBiometricProvider provider,
  ) {
    return call(
      reason: provider.reason,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authenticateBiometricProvider';
}

/// See also [AuthenticateBiometric].
class AuthenticateBiometricProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AuthenticateBiometric, bool> {
  /// See also [AuthenticateBiometric].
  AuthenticateBiometricProvider({
    String reason = '',
  }) : this._internal(
          () => AuthenticateBiometric()..reason = reason,
          from: authenticateBiometricProvider,
          name: r'authenticateBiometricProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authenticateBiometricHash,
          dependencies: AuthenticateBiometricFamily._dependencies,
          allTransitiveDependencies:
              AuthenticateBiometricFamily._allTransitiveDependencies,
          reason: reason,
        );

  AuthenticateBiometricProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reason,
  }) : super.internal();

  final String reason;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant AuthenticateBiometric notifier,
  ) {
    return notifier.build(
      reason: reason,
    );
  }

  @override
  Override overrideWith(AuthenticateBiometric Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthenticateBiometricProvider._internal(
        () => create()..reason = reason,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reason: reason,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AuthenticateBiometric, bool>
      createElement() {
    return _AuthenticateBiometricProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthenticateBiometricProvider && other.reason == reason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthenticateBiometricRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `reason` of this provider.
  String get reason;
}

class _AuthenticateBiometricProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AuthenticateBiometric, bool>
    with AuthenticateBiometricRef {
  _AuthenticateBiometricProviderElement(super.provider);

  @override
  String get reason => (origin as AuthenticateBiometricProvider).reason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
