import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/posts/screens/layout/post_layout.dart';
import 'package:untitled/features/posts/screens/upload_file_screen.dart';
import 'package:untitled/res/widgets/bottom_navigation_barr.dart';
import 'package:untitled/features/setting/screens/setting_screen.dart';

import 'features/video/orientation/portrait_landscape_player_page.dart';

class MobileLayoutScreen extends StatefulWidget {
  static const String routeName = 'moile-layout-screen';

  MobileLayoutScreen({super.key});

  @override
  _MobileLayoutScreenState createState() => _MobileLayoutScreenState();
}

int currentIndex = 4;

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0
          ? SettingScreen()
          : currentIndex == 1
              ? PostLayout()
              : currentIndex == 3
                  ? SettingScreen()
                  : PostLayout(),
      // : MyAppp(),
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
