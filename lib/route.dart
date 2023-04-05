import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/error/error.dart';
import 'package:untitled/features/auth/Screens/student_register.dart';
import 'package:untitled/features/auth/screens/login.dart';
import 'package:untitled/features/posts/screens/upload_file_screen.dart';
import 'package:untitled/features/posts/screens/upload_text_screen%20copy.dart';
import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';
import 'package:untitled/mobile_layout_screen.dart';

import 'features/auth/Screens/registration.dart';

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
    case Registration.routeName:
      return MaterialPageRoute(
        builder: (context) => Registration(),
      );
    case StudentRegister.routeName:
      return MaterialPageRoute(
        builder: (context) => StudentRegister(),
      );
    case MobileLayoutScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => MobileLayoutScreen(),
      );
    case UploadFileScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final type = arguments['type'] as FileType;
      return MaterialPageRoute(
        builder: (context) => UploadFileScreen(type: type),
      );
    case UploadTextScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => UploadTextScreen(),
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
