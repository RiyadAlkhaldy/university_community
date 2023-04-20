import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/auth/models/user_response.dart';
import 'package:untitled/mobile_layout_screen.dart';
import 'package:web_socket_channel/io.dart';

import '../../../core/constant.dart';

final authProvider = StateProvider((ref) => AuthRepository());
final getUserProvider = StateProvider((ref) async {
  List myuser = [];
  await SharedPreferences.getInstance().then((user) {
    myuser.add(user.getString(''));
  }); // final
  return [];
});

class AuthRepository {
  late UserResponseLogin userResponseLogin;
  final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance(); // final

  final dio = Dio();

  void register(
      {required String email,
      required final String uniId,
      required String IDNumber,
      required int type,
      required BuildContext context}) async {
    Map<String, dynamic> data = {
      'email': email,
      'university_id': uniId,
      'id_number': IDNumber,
      'type': type,
    };
    try {
      Response response;
      response = await dio.post(
        '${ApiUrl}auth/register/',
        queryParameters: data,
      );
      print('ok');
      print(response.data);
      if (response.statusCode == 200) {
        userResponseLogin = UserResponseLogin.fromJson(response.data);

        final SharedPreferences prefs = await _prefs;
        prefs.setString('token', userResponseLogin.authorisation.token);
        prefs.setString('name', userResponseLogin.user.name);
        prefs.setString('email', userResponseLogin.user.email);
        prefs.setString(
            'section_id', userResponseLogin.user.sectionId.toString());
        prefs.setString(
            'colloge_id', userResponseLogin.user.collogeId.toString());
        prefs.setString('id', userResponseLogin.user.id.toString());
        prefs.setString('type', userResponseLogin.user.type.toString());
        print(userResponseLogin);
        Navigator.pushNamedAndRemoveUntil(
          context,
          MobileLayoutScreen.routeName,
          (route) => true,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) print(e.toString());
    }
    // ignore: use_build_context_synchronously
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Map<String, dynamic> data = {'email': email, 'password': password};
    print(data);
    try {
      Response response;
      response = await dio.post(
        '${ApiUrl}auth/login/',
        queryParameters: data,
        options: Options(headers: {"Accept": "application/json"}),
      );
      print('ok');
      print(response.data);
      if (response.statusCode == 200) {
        userResponseLogin = UserResponseLogin.fromMap(response.data);

        final SharedPreferences prefs = await _prefs;
        prefs.setString('token', userResponseLogin.authorisation.token);
        prefs.setString('name', userResponseLogin.user.name);
        prefs.setString('email', userResponseLogin.user.email);
        prefs.setString(
            'section_id', userResponseLogin.user.sectionId.toString());
        prefs.setString(
            'colloge_id', userResponseLogin.user.collogeId.toString());
        prefs.setString('id', userResponseLogin.user.id.toString());
        prefs.setString('type', userResponseLogin.user.type.toString());

        print(userResponseLogin);
        Navigator.pushNamedAndRemoveUntil(
          context,
          MobileLayoutScreen.routeName,
          (route) => true,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) print(e.toString());
    }
    // ignore: use_build_context_synchronously
  }

  void websok() async {
    var channel = await IOWebSocketChannel.connect(
        "ws://10.0.2.2:6001/app/laravelWebsocketKey");
// channel.stream.l
    channel.sink.add(json.encode({
      "event": "NotificationRecieved",
      "data": {"channel": "Notification"}
    }));
    // channel.stream.asBroadcastStream();

    channel.stream.listen((_data) {
      print(_data.toString());
    }, onError: (error) {
      print("Socket: error => " + error.toString());
      channel.sink.close();
    }, onDone: () {
      print("Socket: done");
    });
  }
}
