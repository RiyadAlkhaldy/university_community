import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../screens/view_post_screen.dart';

Widget BottomPost(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 30.0,
                  onPressed: () => print('Like post'),
                ),
                Text(
                  '2,515',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.0),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chat),
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewPostScreen(
                          post: postss[index],
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  '350',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          iconSize: 30.0,
          onPressed: () => print('Save post'),
        ),
      ],
    ),
  );
}
