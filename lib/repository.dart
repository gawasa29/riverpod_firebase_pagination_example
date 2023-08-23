import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_firebase_pagination_example/json_converters/union_timestamp.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) {
  return Repository();
}

class Repository {
  static final CollectionReference<Post> _postsRef =
      FirebaseFirestore.instance.collection('posts').withConverter(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  static DocumentReference<Post> _postDocRef({String? postId}) =>
      _postsRef.doc(postId);

  Future<List<Post>> getPosts({
    required int limit,
  }) async {
    try {
      final postsSnap = await _postsRef
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();

      final postList = postsSnap.docs.map((e) => e.data()).toList();

      return postList;
    } catch (e) {
      print(e);
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      throw Exception(errorMessage);
    }
  }

  Future<void> createPost() async {
    final postId = _postDocRef().id;

    final post = Post(id: postId);

    await _postDocRef(postId: postId).set(post);
  }
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
