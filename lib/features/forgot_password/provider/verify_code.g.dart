// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyCodeHash() => r'69e922d7a8c7aee4760c4bf35f59c527de5e47fe';

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

/// See also [verifyCode].
@ProviderFor(verifyCode)
const verifyCodeProvider = VerifyCodeFamily();

/// See also [verifyCode].
class VerifyCodeFamily extends Family<AsyncValue<bool>> {
  /// See also [verifyCode].
  const VerifyCodeFamily();

  /// See also [verifyCode].
  VerifyCodeProvider call(
    ValidateTokenRequest request,
  ) {
    return VerifyCodeProvider(
      request,
    );
  }

  @override
  VerifyCodeProvider getProviderOverride(
    covariant VerifyCodeProvider provider,
  ) {
    return call(
      provider.request,
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
  String? get name => r'verifyCodeProvider';
}

/// See also [verifyCode].
class VerifyCodeProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [verifyCode].
  VerifyCodeProvider(
    ValidateTokenRequest request,
  ) : this._internal(
          (ref) => verifyCode(
            ref as VerifyCodeRef,
            request,
          ),
          from: verifyCodeProvider,
          name: r'verifyCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyCodeHash,
          dependencies: VerifyCodeFamily._dependencies,
          allTransitiveDependencies:
              VerifyCodeFamily._allTransitiveDependencies,
          request: request,
        );

  VerifyCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final ValidateTokenRequest request;

  @override
  Override overrideWith(
    FutureOr<bool> Function(VerifyCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyCodeProvider._internal(
        (ref) => create(ref as VerifyCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _VerifyCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyCodeProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyCodeRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `request` of this provider.
  ValidateTokenRequest get request;
}

class _VerifyCodeProviderElement extends AutoDisposeFutureProviderElement<bool>
    with VerifyCodeRef {
  _VerifyCodeProviderElement(super.provider);

  @override
  ValidateTokenRequest get request => (origin as VerifyCodeProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
