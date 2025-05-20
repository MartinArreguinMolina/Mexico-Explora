// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageHash() => r'a1511338c79bc26d8e2ae63668d0173e938cd99a';

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

/// See also [image].
@ProviderFor(image)
const imageProvider = ImageFamily();

/// See also [image].
class ImageFamily extends Family<AsyncValue<List<ImageEntity>>> {
  /// See also [image].
  const ImageFamily();

  /// See also [image].
  ImageProvider call(int perPage, String query, bool landscape) {
    return ImageProvider(perPage, query, landscape);
  }

  @override
  ImageProvider getProviderOverride(covariant ImageProvider provider) {
    return call(provider.perPage, provider.query, provider.landscape);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'imageProvider';
}

/// See also [image].
class ImageProvider extends FutureProvider<List<ImageEntity>> {
  /// See also [image].
  ImageProvider(int perPage, String query, bool landscape)
    : this._internal(
        (ref) => image(ref as ImageRef, perPage, query, landscape),
        from: imageProvider,
        name: r'imageProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$imageHash,
        dependencies: ImageFamily._dependencies,
        allTransitiveDependencies: ImageFamily._allTransitiveDependencies,
        perPage: perPage,
        query: query,
        landscape: landscape,
      );

  ImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.perPage,
    required this.query,
    required this.landscape,
  }) : super.internal();

  final int perPage;
  final String query;
  final bool landscape;

  @override
  Override overrideWith(
    FutureOr<List<ImageEntity>> Function(ImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ImageProvider._internal(
        (ref) => create(ref as ImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        perPage: perPage,
        query: query,
        landscape: landscape,
      ),
    );
  }

  @override
  FutureProviderElement<List<ImageEntity>> createElement() {
    return _ImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageProvider &&
        other.perPage == perPage &&
        other.query == query &&
        other.landscape == landscape;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, landscape.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ImageRef on FutureProviderRef<List<ImageEntity>> {
  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `landscape` of this provider.
  bool get landscape;
}

class _ImageProviderElement extends FutureProviderElement<List<ImageEntity>>
    with ImageRef {
  _ImageProviderElement(super.provider);

  @override
  int get perPage => (origin as ImageProvider).perPage;
  @override
  String get query => (origin as ImageProvider).query;
  @override
  bool get landscape => (origin as ImageProvider).landscape;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
