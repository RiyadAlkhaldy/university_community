import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/theme/theme_data/theme_data_dark.dart';
// import 'package:untitled/features/auth/screens/signup.dart';
import 'package:untitled/features/setting/screens/header_setting_screen.dart';
import 'package:untitled/features/setting/screens/setting_screen.dart';
import 'package:untitled/features/user/presentation/layout/buttom_navigation_bar.dart';
import 'package:untitled/mobile_layout_screen.dart';
import 'package:untitled/route.dart';
// import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';
import 'package:untitled/themes.dart';

import 'features/auth/Screens/launch.dart';
import 'features/auth/Screens/student_register.dart';
import 'features/auth/Screens/admin_register.dart';
import 'features/auth/controller/auth_controller.dart';

// 563492ad6f917000010000013d24e4038ca942559b31b58c298d1c40
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterDownloader.initialize(
  //   debug: true,
  // );
  await Settings.init(cacheProvider: SharePreferenceCache());
  final auth = AuthController();
  // auth.websok();
  print('hi');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final isDarkModes = Settings.getValue<bool>(HeaderSettingScreen.keyDarkMode,
      defaultValue: true);
  //
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // late SharedPreferences prefs;
  String? token = null;
  bool initial = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (initial == true) {
      SharedPreferences.getInstance().then((value) {
        setState(() {
          // value.clear();
          token = value.getString('token');
          initial = false;
        });
      });
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ValueChangeObserver<bool>(
          cacheKey: HeaderSettingScreen.keyDarkMode,
          // initTheme: MyThemes.darkTheme,
          defaultValue: isDarkModes!,
          builder: (contex, isDarkMode, _) => MaterialApp(
                onGenerateRoute: (initialRoute) => generateRoute(initialRoute),

                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
                // home: SettingScreen(),
                home: token == null ? StartScreen() : MobileLayoutScreen(),
              ));
    }
  }
}
