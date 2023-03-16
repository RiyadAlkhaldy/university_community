// import 'package:flutter/material.dart';
// import 'package:untitled/features/posts/screens/post_screen.dart';
// import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';

// class BottomNavigationBarOurApp extends StatefulWidget {
//   const BottomNavigationBarOurApp({super.key});

//   @override
//   State<BottomNavigationBarOurApp> createState() =>
//       _BottomNavigationBarOurAppState();
// }

// int currentIndex = 0;

// class _BottomNavigationBarOurAppState extends State<BottomNavigationBarOurApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentIndex == 0 ? UserProfileScreen() : PostScreen(),
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: (value) {
//             currentIndex = value;

//             print(value);
//             setState(() {});
//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.verified_user), label: 'Home'),
//           ]),
//     );
//   }
// }
