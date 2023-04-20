import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/features/posts/screens/all_colloge_posts_screen.dart';
import 'package:untitled/features/posts/screens/all_section_posts_screen.dart';
import 'package:untitled/features/posts/screens/post_screen.dart';

import '../all_post_screen.dart';

class PostLayout extends ConsumerStatefulWidget {
  PostLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<PostLayout> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<PostLayout>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabBarController;
  //! notifications firebase
  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBarr(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  backgroundColor: appBarColor,
                  floating: true,
                  snap: true,
                  pinned: true,
                  title: AppBarr(),
                  bottom: TabBarr(),
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: tabBarController,
            children: [
              AllPostScreen(),
              AllCollogePostsScreen(),
              AllSectionPostsScreen(),
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButtonWidget(tabBarController: tabBarController),
      ),
    );
  }

  Widget AppBarr() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 5),
      // decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'University Communty',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  TabBar TabBarr() {
    return TabBar(
      controller: tabBarController,
      indicatorColor: tabColor,
      indicatorWeight: 4,
      labelColor: tabColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      tabs: const [
        Tab(
          text: 'All Posts',
        ),
        Tab(
          text: 'Colloge Posts',
        ),
        Tab(
          text: 'Section Posts',
        ),
      ],
    );
  }
}

//! floating Action Button Widget
class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget({
    Key? key,
    required this.tabBarController,
  }) : super(key: key);

  final TabController tabBarController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        if (tabBarController.index == 0) {
          // Navigator.pushNamed(context, SelectContactsScreen.routeName);
        } else {
          File? pickedImage = await pickImageFromGallery(context);
          if (pickedImage != null) {
            // Navigator.pushNamed(
            //   context,
            //   ConfirmStatusScreen.routeName,
            //   arguments: pickedImage,
            // );
          }
        }
      },
      backgroundColor: tabColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

//! popup menu buttom widget
// class PopupMenuButtomWidget extends StatelessWidget {
//   const PopupMenuButtomWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       icon: const Icon(
//         Icons.more_vert,
//         color: Colors.grey,
//       ),
//       itemBuilder: (context) => [
//         PopupMenuItem(
//           child: const Text(
//             'Create Group',
//           ),
//           // onTap: () => Future(
//           //   () => Navigator.pushNamed(context, UserProfileScreen.routeName),
//           // ),
//         )
//       ],
//     );
//   }
// }


//  AppBar AppBarr() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: appBarColor,
//       centerTitle: false,
//       title: const Text(
//         'University Communty',
//         style: TextStyle(
//           fontSize: 20,
//           color: Colors.grey,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.search, color: Colors.grey),
//           onPressed: () {},
//         ),
//         PopupMenuButtomWidget(),
//       ],
//       // title: TabBarr(),
//       // bottom: TabBarr(),
//     );
//   }