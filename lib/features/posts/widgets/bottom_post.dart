import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../screens/view_post_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget BottomPost(BuildContext context, Posts post) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.w600),
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
                              post: post,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      '350',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                      // style: TextStyle(
                      //   fontSize: 14.0,
                      //   fontWeight: FontWeight.w600,
                      // ),
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
        // time age
        Text(
            timeago.format(
              DateTime.parse(post.createdAt),
            ),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5),
                )),
      ],
    ),
  );
}
