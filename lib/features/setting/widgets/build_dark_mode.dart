// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/features/setting/widgets/icon_widget.dart';



// Widget buildAcount() => SimpleSettingsTile(
//       title: "Account Settings",
//       subtitle: 'privacy, security, Languages',
//       child: Container(),
//       leading: IconWidget(
//         icon: Icons.person,
//         color: Color(0xFF642ef3),
//       ),
//       onTap: () {
//         // switchList = darkMode;
//       },
//     );
Widget buildLogout() => SimpleSettingsTile(
      title: "Logout",
      leading: IconWidget(icon: Icons.logout, color: Color(0xFF642ef3)),
      onTap: () {
        // switchList = darkMode;
      },
    );
Widget buildDeleteAccount() => SimpleSettingsTile(
      title: "Delete Account",
      leading: IconWidget(icon: Icons.delete, color: Colors.pink),
      onTap: () {
        // switchList = darkMode;
      },
    );
Widget buildReportBug({required BuildContext context}) => SimpleSettingsTile(
      title: "Report A Bug",
      leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
      onTap: () {
        // switchList = darkMode;
      },
    );
    Widget buildSendFeedback({required BuildContext context}) => SimpleSettingsTile(
      title: "Send Feedback",
      leading: IconWidget(icon: Icons.feedback, color: Colors.purple),
      onTap: () {
        // switchList = darkMode;
      },
    );
