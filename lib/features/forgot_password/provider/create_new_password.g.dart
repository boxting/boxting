// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_password.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createNewPasswordHash() => r'b266c348d702eb5aa10c2d754f54637e7c567cae';

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

/// See also [createNewPassword].
@ProviderFor(createNewPassword)
const createNewPasswordProvider = CreateNewPasswordFamily();

/// See also [createNewPassword].
class CreateNewPasswordFamily extends Family<AsyncValue<bool>> {
  /// See also [createNewPassword].
  const CreateNewPasswordFamily();

  /// See also [createNewPassword].
  CreateNewPasswordProvider call(
    NewPasswordRequest request,
  ) {
    return CreateNewPasswordProvider(
      request,
    );
  }

  @override
  CreateNewPasswordProvider getProviderOverride(
    covariant CreateNewPasswordProvider provider,
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
  String? get name => r'createNewPasswordProvider';
}

/// See also [createNewPassword].
class CreateNewPasswordProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createNewPassword].
  CreateNewPasswordProvider(
    NewPasswordRequest request,
  ) : this._internal(
          (ref) => createNewPassword(
            ref as CreateNewPasswordRef,
            request,
          ),
          from: createNewPasswordProvider,
          name: r'createNewPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNewPasswordHash,
          dependencies: CreateNewPasswordFamily._dependencies,
          allTransitiveDependencies:
              CreateNewPasswordFamily._allTransitiveDependencies,
          request: request,
        );

  CreateNewPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final NewPasswordRequest request;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateNewPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNewPasswordProvider._internal(
        (ref) => create(ref as CreateNewPasswordRef),
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
    return _CreateNewPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNewPasswordProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNewPasswordRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `request` of this provider.
  NewPasswordRequest get request;
}

class _CreateNewPasswordProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CreateNewPasswordRef {
  _CreateNewPasswordProviderElement(super.provider);

  @override
  NewPasswordRequest get request =>
      (origin as CreateNewPasswordProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
