// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/posts/screens/view_post_screen.dart';
import 'package:untitled/features/posts/widgets/body_the_post_video.dart';

import 'body_the_post_image.dart';
import 'bottom_post.dart';

// Widget buildPost(int index, BuildContext context) {
//   return NewWidget();
// }

class buildPost extends StatelessWidget {
  final int index;
  final Post? post;
  BuildContext contextl;
  buildPost({
    Key? key,
    required this.index,
    required this.contextl,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        // !
        // height: 560.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  //! Header The Post Widget
                  HeaderThePost(index: index),

                  if (post!.type == 0)
                    BodyThePostImage(index: index, post: post!),
                  if (post!.type == 1)
                    BodyThePostVideo(
                      index: index,
                      post: post,
                    ),
                  BottomPost(context, index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderThePost extends StatelessWidget {
  final int index;
  const HeaderThePost({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 50.0,
              width: 50.0,
              image: AssetImage(postss[index].authorImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        postss[index].authorName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(postss[index].timeAgo),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            useRootNavigator: false,
            context: context,
            builder: (context) {
              return Dialog(
                child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shrinkWrap: true,
                    children: ['Delete', 'Modify']
                        .map(
                          (e) => InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(115, 138, 222, 245),
                                      offset: Offset(0, 5),
                                      blurRadius: 15.0,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Text(e),
                              ),
                              onTap: () {
                                // deletePost(
                                //   widget.snap['postId']
                                //       .toString(),
                                // );
                                // remove the dialog box
                                Navigator.of(context).pop();
                              }),
                        )
                        .toList()),
              );
            },
          );
        },
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
