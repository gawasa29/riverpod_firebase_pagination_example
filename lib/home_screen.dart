import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_firebase_pagination_example/repository.dart';

part 'home_screen.g.dart';

@riverpod
class AsyncPosts extends _$AsyncPosts {
  @override
  FutureOr<List<Post>> build({required int limit}) {
    print('🛜 IN AsyncPosts');
    return ref.watch(repositoryProvider).getPosts(limit: limit);
  }

  Future<void> createPost() async {
    await ref.read(repositoryProvider).createPost();

    ref.invalidateSelf();
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build HomeScreen ');

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () {
          ref.invalidate(asyncPostsProvider);

          return ref.read(asyncPostsProvider(limit: 1).future);
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 30),
          itemBuilder: (context, index) {
            const pageSize = 20;

            final page = (index ~/ pageSize) + 1;
            final limit = pageSize * page;

            print('index: $index');
            print('page: $page');
            print('limit: $limit');

            final postList = ref.watch(asyncPostsProvider(limit: limit));

            return postList.when(
              error: (err, stack) => Text('Error $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (posts) {
                if (index >= posts.length) return null;

                print('posts: ${posts.length}');

                final post = posts[index];

                return ListTile(title: Text(post.id));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO Tap to refresh the screen and view new posts
          ref.read(asyncPostsProvider(limit: 1).notifier).createPost();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
