import 'package:flutter/material.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled/features/setting/widgets/icon_widget.dart';
import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Reyath Alkhldy",
      subtitle: 'Your Profile',
      leading: IconWidget(
        icon: Icons.person,
        color: Colors.green,
      ),
      onTap: () {
        // Navigator.of(context).pushNamed(UserProfileScreen.routeName);
      },
      child: UserProfileScreen(),
    );
    const Placeholder();
  }
}
