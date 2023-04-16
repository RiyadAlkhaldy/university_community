import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/utils/utils.dart';

import '../../../core/constant.dart';
import '../models/comment_model.dart';

// final myrequest = Provider<ResponsePosts>((ref) {
//   return MyRequest().getResponsePosts();

// });

final commentsProvider =
    StateNotifierProvider<RepositoryComment, List<Comments>>((ref) {
  // final myreq = ref.watch(myrequest);
  return RepositoryComment();
});
// final Provider = FutureProvider.family<, >((ref, ) async {
//   return ;
// });
final AllcommentsProvider = FutureProvider.family((ref, int post_id) async {
  List<Comments> comments = [];
  await ref
      .read(commentsProvider.notifier)
      .getAllComments(post_id)
      .then((value) {
    comments = ref.watch(commentsProvider.notifier).state;
    return comments;
  });
  return comments;

  // ignore: invalid_use_of_protected_member
});

class RepositoryComment extends StateNotifier<List<Comments>> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dio = Dio();

  RepositoryComment() : super([]);

  // RepositoryPosts();
  Future<List<Comments>> getAllComments(int post_id) async {
    final SharedPreferences prefs = await _prefs;
    final ResponseComment responseComment;
    // final WidgetRef ref;

    Response response;

    response = await dio.post(
      '${ApiUrl}comment/get-all-comments/',
      queryParameters: {'post_id': post_id},
      options: Options(headers: {
        'authorization': 'Bearer ${prefs.getString('token')}',
        "Accept": "application/json"
      }),
    );
    print('ok');
    print(response.data);
    ResponseComment res = ResponseComment.fromMap(response.data);
    List<Comments> comments = res.comments;

    state = [...comments];

    if (response.statusCode == 200) {
      print(state);
      // Navigator.pop(context);
    }
    // showSnackBar(context: context, content: state.toString());
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
