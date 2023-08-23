// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncPostsHash() => r'4fa1396c52dda8c90460cdc5cc24896531c289e5';

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

abstract class _$AsyncPosts
    extends BuildlessAutoDisposeAsyncNotifier<List<Post>> {
  late final int limit;

  FutureOr<List<Post>> build({
    required int limit,
  });
}

/// See also [AsyncPosts].
@ProviderFor(AsyncPosts)
const asyncPostsProvider = AsyncPostsFamily();

/// See also [AsyncPosts].
class AsyncPostsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [AsyncPosts].
  const AsyncPostsFamily();

  /// See also [AsyncPosts].
  AsyncPostsProvider call({
    required int limit,
  }) {
    return AsyncPostsProvider(
      limit: limit,
    );
  }

  @override
  AsyncPostsProvider getProviderOverride(
    covariant AsyncPostsProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'asyncPostsProvider';
}

/// See also [AsyncPosts].
class AsyncPostsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AsyncPosts, List<Post>> {
  /// See also [AsyncPosts].
  AsyncPostsProvider({
    required this.limit,
  }) : super.internal(
          () => AsyncPosts()..limit = limit,
          from: asyncPostsProvider,
          name: r'asyncPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$asyncPostsHash,
          dependencies: AsyncPostsFamily._dependencies,
          allTransitiveDependencies:
              AsyncPostsFamily._allTransitiveDependencies,
        );

  final int limit;

  @override
  bool operator ==(Object other) {
    return other is AsyncPostsProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Post>> runNotifierBuild(
    covariant AsyncPosts notifier,
  ) {
    return notifier.build(
      limit: limit,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
