// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:untitled/features/posts/models/post_model.dart';

import 'body_the_post_image.dart';
import 'body_the_post_text.dart';
import 'body_the_post_video.dart';
import 'bottom_post.dart';

class buildPost extends StatelessWidget {
  final int index;
  final Posts? post;
  BuildContext contextl;
  buildPost({
    Key? key,
    required this.index,
    required this.contextl,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('post =     ${post!.url}');
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
                  if (post!.type == 2 && post!.url != null)
                    HeaderThePost(
                      index: index,
                      post: post!,
                    ),

                  if (post!.type == 2 && post!.url != null)
                    BodyThePostImage(index: index, post: post!),
                  if (post!.type == 3 && post!.url != null)
                    BodyThePostVideo(
                      index: index,
                      post: post,
                    ),
                  if (post!.type == 1 && post!.url == null)
                  BodyThePostText(index: 1,post: post!,),
                    BottomPost(context, post!),
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
  final Posts post;
  const HeaderThePost({
    Key? key,
    required this.index,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.grey,
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
              image: NetworkImage(post.url!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        post.name,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 20, color: Colors.black),
      ),
      subtitle: Text(post.content!),
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
