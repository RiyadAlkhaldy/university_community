import 'package:flutter/material.dart';
import 'package:untitled/features/video/orientation/portrait_landscape_player_page.dart';
import 'package:untitled/features/video/orientation/portrait_player_widget.dart';

import '../models/post_model.dart';
import '../screens/view_post_screen.dart';

class BodyThePostVideo extends StatelessWidget {
  final int index;
  final Post? post;
  const BodyThePostVideo({
    Key? key,
    required this.index,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print('Like post'),
        // onTap: () => print("push video"),
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ViewPostScreen(
                post: post!,
              ),
            ),
          );
        },
        child: LimitedBox(
          maxWidth: double.infinity,
          maxHeight: 400,
          child: PortraitPlayerWidget(
            post: post,
          ),
        ));
  }
}
