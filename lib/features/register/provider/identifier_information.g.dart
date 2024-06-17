// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier_information.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$identifierInformationHash() =>
    r'05b9a77d330311f6440e29ed46b147412e9ea44c';

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

/// See also [identifierInformation].
@ProviderFor(identifierInformation)
const identifierInformationProvider = IdentifierInformationFamily();

/// See also [identifierInformation].
class IdentifierInformationFamily extends Family<AsyncValue<DniResponseData>> {
  /// See also [identifierInformation].
  const IdentifierInformationFamily();

  /// See also [identifierInformation].
  IdentifierInformationProvider call(
    String dni,
  ) {
    return IdentifierInformationProvider(
      dni,
    );
  }

  @override
  IdentifierInformationProvider getProviderOverride(
    covariant IdentifierInformationProvider provider,
  ) {
    return call(
      provider.dni,
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
  String? get name => r'identifierInformationProvider';
}

/// See also [identifierInformation].
class IdentifierInformationProvider
    extends AutoDisposeFutureProvider<DniResponseData> {
  /// See also [identifierInformation].
  IdentifierInformationProvider(
    String dni,
  ) : this._internal(
          (ref) => identifierInformation(
            ref as IdentifierInformationRef,
            dni,
          ),
          from: identifierInformationProvider,
          name: r'identifierInformationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$identifierInformationHash,
          dependencies: IdentifierInformationFamily._dependencies,
          allTransitiveDependencies:
              IdentifierInformationFamily._allTransitiveDependencies,
          dni: dni,
        );

  IdentifierInformationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dni,
  }) : super.internal();

  final String dni;

  @override
  Override overrideWith(
    FutureOr<DniResponseData> Function(IdentifierInformationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IdentifierInformationProvider._internal(
        (ref) => create(ref as IdentifierInformationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dni: dni,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DniResponseData> createElement() {
    return _IdentifierInformationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IdentifierInformationProvider && other.dni == dni;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dni.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IdentifierInformationRef
    on AutoDisposeFutureProviderRef<DniResponseData> {
  /// The parameter `dni` of this provider.
  String get dni;
}

class _IdentifierInformationProviderElement
    extends AutoDisposeFutureProviderElement<DniResponseData>
    with IdentifierInformationRef {
  _IdentifierInformationProviderElement(super.provider);

  @override
  String get dni => (origin as IdentifierInformationProvider).dni;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
