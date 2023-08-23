// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryHash() => r'578cc20adeab2ac8b17729470fafe39e8437a3f3';

/// See also [repository].
@ProviderFor(repository)
final repositoryProvider = AutoDisposeProvider<Repository>.internal(
  repository,
  name: r'repositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$repositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepositoryRef = AutoDisposeProviderRef<Repository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
