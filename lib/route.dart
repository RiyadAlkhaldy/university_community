import 'package:flutter/material.dart';
import 'package:untitled/core/error/error.dart';
import 'package:untitled/features/auth/screens/login.dart';
import 'package:untitled/features/auth/screens/signup.dart';
import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case UserProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => UserProfileScreen(),
      );
      case Login.routeName:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );
      case SignUp.routeName:
      return MaterialPageRoute(
        builder: (context) => SignUp(),
      );

    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];
    //   final isGroupChat = arguments['isGroupChat'];
    //   final profilePic = arguments['profilePic'];
    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //       isGroupChat: false,
    //       profilePic: profilePic  ,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
