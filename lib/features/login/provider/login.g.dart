// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'c36de53b987f70c6a819f40d3360684706ad85e1';

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

abstract class _$Login
    extends BuildlessAutoDisposeAsyncNotifier<LoginResponseData> {
  late final String username;
  late final String password;

  FutureOr<LoginResponseData> build(
    String username,
    String password,
  );
}

/// See also [Login].
@ProviderFor(Login)
const loginProvider = LoginFamily();

/// See also [Login].
class LoginFamily extends Family<AsyncValue<LoginResponseData>> {
  /// See also [Login].
  const LoginFamily();

  /// See also [Login].
  LoginProvider call(
    String username,
    String password,
  ) {
    return LoginProvider(
      username,
      password,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      provider.username,
      provider.password,
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
  String? get name => r'loginProvider';
}

/// See also [Login].
class LoginProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Login, LoginResponseData> {
  /// See also [Login].
  LoginProvider(
    String username,
    String password,
  ) : this._internal(
          () => Login()
            ..username = username
            ..password = password,
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          username: username,
          password: password,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String username;
  final String password;

  @override
  FutureOr<LoginResponseData> runNotifierBuild(
    covariant Login notifier,
  ) {
    return notifier.build(
      username,
      password,
    );
  }

  @override
  Override overrideWith(Login Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        () => create()
          ..username = username
          ..password = password,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Login, LoginResponseData>
      createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeAsyncNotifierProviderRef<LoginResponseData> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _LoginProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Login, LoginResponseData>
    with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  String get username => (origin as LoginProvider).username;
  @override
  String get password => (origin as LoginProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
