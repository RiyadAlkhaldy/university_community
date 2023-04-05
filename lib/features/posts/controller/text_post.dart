import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final uploadFileProvider = Provider.autoDispose<TextPost>((ref) {
  return TextPost();
});
final uploadFilePppp = FutureProvider.autoDispose((ref) async {
  final file = ref.watch(uploadFileProvider);
  return file;
});

class TextPost {
  final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance(); // final

  final String url = 'http://10.0.2.2:8000/api/';
  final dio = Dio();

  void textPost(
      {required String content, required BuildContext context}) async {
    final SharedPreferences prefs = await _prefs;

    Map<String, dynamic> data = {
      'content': content,
      'type': 1,
      'user_id': prefs.getString('id'),
      'section_id': prefs.getString('section_id'),
      'colloge_id': prefs.getString('colloge_id'),
    };
    Response response;
    response = await dio.post(
      '${url}posts/store/',
      queryParameters: data,
      options: Options(headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        "Accept": "application/json"
      }),
    );
    print('ok');
    print(response.data);
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
    // ignore: use_build_context_synchronously
  }
}
