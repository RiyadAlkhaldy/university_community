// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/video/orientation/video_player_fullscreen_widget.dart';
import 'package:untitled/features/video/screens/basics/network_player_widget.dart';

class PortraitPlayerWidget extends StatefulWidget {
  final Post? post;
  PortraitPlayerWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  _PortraitPlayerWidgetState createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {
  late VideoPlayerController controller;
  final v1 =
      "https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761";
  @override
  void initState() {
    super.initState();

    /// for testing purposes: 'https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/ezgif-7-565b5237f95f.mp4?alt=media&token=51e8e031-1e87-46e6-bd32-98c5367da59d'
    controller = VideoPlayerController.network(widget.post!.videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    // height: controller.value.size.height,
    height: double.infinity,
    child: VideoPlayerFullscreenWidget(controller: controller),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 5),
          blurRadius: 8.0,
        ),
      ],
    ),
    // margin: EdgeInsets.all(10.0),
    width: double.infinity,
  );
}
