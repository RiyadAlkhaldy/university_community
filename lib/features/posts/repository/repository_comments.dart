import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/comment_model.dart';

// final myrequest = Provider<ResponsePosts>((ref) {
//   return MyRequest().getResponsePosts();

// });

final postsProvider =
    StateNotifierProvider<RepositoryComment, List<Comment>>((ref) {
  // final myreq = ref.watch(myrequest);
  return RepositoryComment();
});
// final Provider = FutureProvider.family<, >((ref, ) async {
//   return ;
// });
final AllcommentsProvider = FutureProvider.family((ref, int post_id) async {
  List<Comment> comments = [];
  await ref.read(postsProvider.notifier).getAllComments(post_id).then((value) {
    comments = ref.watch(postsProvider.notifier).state;
    return comments;
  });
  return comments;

  // ignore: invalid_use_of_protected_member
});

class RepositoryComment extends StateNotifier<List<Comment>> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String url = 'http://10.0.2.2:8000/api/';
  final dio = Dio();

  RepositoryComment() : super([]);

  // RepositoryPosts();
  Future<List<Comment>> getAllComments(int post_id) async {
    final SharedPreferences prefs = await _prefs;
    final ResponseComment responseComment;
    // final WidgetRef ref;

    Response response;

    response = await dio.post(
      '${url}posts/get-all-posts/',
      queryParameters: {'post_id': post_id},
      options: Options(headers: {
        'authorization': 'Bearer ${prefs.getString('token')}',
        "Accept": "application/json"
      }),
    );
    print('ok');
    print(response.data);
    ResponseComment res = ResponseComment.fromMap(response.data);
    List<Comment> posts = res.comment.map((e) => e).toList();

    state = [...posts];

    if (response.statusCode == 200) {
      print(state);
      // Navigator.pop(context);
    }
    return state;

    // ignore: use_build_context_synchronously
  }

  // void deletePost(int post_id) {
  //   print('deleted number $post_id');
  //   state = [
  //     for (var post in state)
  //       if (post.id != post_id) post,
  //   ];
  // }
}
