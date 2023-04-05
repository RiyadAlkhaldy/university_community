// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:untitled/features/posts/models/post_model.dart';

import '../screens/view_post_screen.dart';

class BodyThePostImage extends StatelessWidget {
  final Posts post;
  final int index;
  BodyThePostImage({
    Key? key,
    required this.post,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => print('Like post'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ViewPostScreen(
              post: post,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 5),
              blurRadius: 8.0,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(post.url!),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
