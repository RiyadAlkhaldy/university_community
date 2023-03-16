import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/features/setting/screens/account_setting_screen.dart';
import 'package:untitled/features/setting/screens/header_setting_screen.dart';
import 'package:untitled/features/setting/screens/user_accounnt.dart';

import '../widgets/build_dark_mode.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final switchList = false;
  static const keyDarkMode = 'key-dark-mode';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 22,
          ),
          UserAccount(),
          AccountSettingScreen(),
          SizedBox(
            height: 32,
          ),
          SettingsGroup(title: "GENERAL", children: [
            buildLogout(),
            buildDeleteAccount(),
          ]),
          SizedBox(
            height: 32,
          ),
          SettingsGroup(title: "Feedback", children: [
            buildReportBug(context: context),
            buildSendFeedback(context: context),
          ]),
        ],
      ),
    );
  }
}
