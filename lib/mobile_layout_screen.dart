import 'package:flutter/material.dart';
import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/posts/screens/layout/post_layout.dart';
import 'package:untitled/features/video/screens/basics/network_player_widget.dart';
import 'package:untitled/res/widgets/bottom_navigation_barr.dart';
import 'package:untitled/features/posts/screens/post_screen.dart';
import 'package:untitled/features/setting/screens/setting_screen.dart';
import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';

import 'features/riverpodexam/my_app.dart';
import 'features/video/orientation/portrait_landscape_player_page.dart';
import 'features/video/orientation/portrait_player_widget.dart';
import 'features/video/orientation/video_player_both_widget.dart';

class MobileLayoutScreen extends StatefulWidget {
  @override
  _MobileLayoutScreenState createState() => _MobileLayoutScreenState();
}

int currentIndex = 4;

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEDF0F6),
      body: currentIndex == 0
          ? SettingScreen()
          : currentIndex == 1
              ? PortraitLandscapePlayerPage(
                  index: 1,
                  post: postss[0],
                )
              : currentIndex == 2
                  ? PostLayout()
                  : MyAppp(),
      bottomNavigationBar: BottomNavigationBarr(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
