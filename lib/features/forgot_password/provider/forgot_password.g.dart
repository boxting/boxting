// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forgotPasswordHash() => r'7dda2c8c50c087c6f31fb4fb1291816cd01a1223';

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

/// See also [forgotPassword].
@ProviderFor(forgotPassword)
const forgotPasswordProvider = ForgotPasswordFamily();

/// See also [forgotPassword].
class ForgotPasswordFamily extends Family<AsyncValue<bool>> {
  /// See also [forgotPassword].
  const ForgotPasswordFamily();

  /// See also [forgotPassword].
  ForgotPasswordProvider call(
    String email,
  ) {
    return ForgotPasswordProvider(
      email,
    );
  }

  @override
  ForgotPasswordProvider getProviderOverride(
    covariant ForgotPasswordProvider provider,
  ) {
    return call(
      provider.email,
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
  String? get name => r'forgotPasswordProvider';
}

/// See also [forgotPassword].
class ForgotPasswordProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [forgotPassword].
  ForgotPasswordProvider(
    String email,
  ) : this._internal(
          (ref) => forgotPassword(
            ref as ForgotPasswordRef,
            email,
          ),
          from: forgotPasswordProvider,
          name: r'forgotPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgotPasswordHash,
          dependencies: ForgotPasswordFamily._dependencies,
          allTransitiveDependencies:
              ForgotPasswordFamily._allTransitiveDependencies,
          email: email,
        );

  ForgotPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ForgotPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgotPasswordProvider._internal(
        (ref) => create(ref as ForgotPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ForgotPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForgotPasswordProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ForgotPasswordRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `email` of this provider.
  String get email;
}

class _ForgotPasswordProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ForgotPasswordRef {
  _ForgotPasswordProviderElement(super.provider);

  @override
  String get email => (origin as ForgotPasswordProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
