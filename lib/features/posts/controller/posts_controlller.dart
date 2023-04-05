import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/posts/models/post_model.dart';

final postsResponseProvider =
    Provider<PostsController>((ref) => PostsController());
final getAllPostsProvider = FutureProvider<List<Posts>>((ref) async {
  final postsResponse =await ref.watch(postsResponseProvider).getAllPosts;
  return postsResponse;
});

class PostsController {
  final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance(); // final

  final String url = 'http://10.0.2.2:8000/api/';
  final dio = Dio();

   Future<List<Posts>> get getAllPosts async {
    final SharedPreferences prefs = await _prefs;
    final ResponsePosts responsePosts;

    Response response;
    
        response = await dio.post(
      '${url}posts/get-all-posts/',
      options: Options(headers: {
        'authorization': 'Bearer ${prefs.getString('token')}',
        "Accept": "application/json"
      }),
    );
     print('ok');
    print(response.data);
    responsePosts = ResponsePosts.fromJson(response.data);

    if (response.statusCode == 200) {
      print(responsePosts.posts);
      // Navigator.pop(context);
    }
    return responsePosts.posts;
 
   

    // ignore: use_build_context_synchronously
  }
}
