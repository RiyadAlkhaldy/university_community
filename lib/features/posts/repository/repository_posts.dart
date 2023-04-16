import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/posts/models/post_model.dart';

import '../../../core/constant.dart';

// final myrequest = Provider<ResponsePosts>((ref) {
//   return MyRequest().getResponsePosts();

// });

final postsProvider =
    StateNotifierProvider<RepositoryPosts, List<Posts>>((ref) {
  // final myreq = ref.watch(myrequest);
  return RepositoryPosts();
});
final AllPostsProvider = FutureProvider<List<Posts>>((ref) async {
  List<Posts> posts = [];
  await ref.read(postsProvider.notifier).getAllPosts.then((value) {
    posts = ref.watch(postsProvider.notifier).state;
    return posts;
  });
  return posts;

  // ignore: invalid_use_of_protected_member
});

class RepositoryPosts extends StateNotifier<List<Posts>> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dio = Dio();

  RepositoryPosts() : super([]);

  // RepositoryPosts();
  Future<List<Posts>> get getAllPosts async {
    final SharedPreferences prefs = await _prefs;
    final ResponsePosts responsePosts;

    Response response;

    response = await dio.post(
      '${ApiUrl}posts/get-all-posts/',
      options: Options(headers: {
        'authorization': 'Bearer ${prefs.getString('token')}',
        "Accept": "application/json"
      }),
    );
    print('ok');
    print(response.data);
    ResponsePosts res = ResponsePosts.fromMap(response.data);
    List<Posts> posts = res.posts.map((e) => e).toList();

    state = [...posts];

    if (response.statusCode == 200) {
      print(state);
      // Navigator.pop(context);
    }
    return state;

    // ignore: use_build_context_synchronously
  }

  void deletePost(int post_id) {
    print('deleted number $post_id');
    state = [
      for (var post in state)
        if (post.id != post_id) post,
    ];
  }

  void addLikeOrUndo(Posts currentPost) {
    List<Posts> posts = [];
    if (currentPost.amILike == 0) {
      state.forEach((post) {
        if (post.id == currentPost.id)
          post = post.copyWith(amILike: 1, numberLikes: post.numberLikes + 1);
        posts.add(post);
      });
    } else {
      state.forEach((post) {
        if (post.id == currentPost.id)
          post = post.copyWith(amILike: 0, numberLikes: post.numberLikes - 1);
        posts.add(post);
      });
    }
    state = [...posts];

    print('liked post number ${currentPost}');
  }
  // State =[...posts];
}
