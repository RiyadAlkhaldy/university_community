import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/core/utils/loader.dart';
import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/posts/repository/repository_comments.dart';

import 'package:untitled/features/video/orientation/portrait_landscape_player_page.dart';

import '../models/comment_model.dart';
import '../repository/repository_posts.dart';
import '../widgets/build_comment.dart';
import '../widgets/build_post.dart';
import 'package:timeago/timeago.dart' as timeago;

class ViewPostScreen extends ConsumerStatefulWidget {
  static const String routeName = "view-post-screen";
  final Posts post;

  ViewPostScreen({required this.post});

  @override
  ConsumerState<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends ConsumerState<ViewPostScreen> {
  bool dataLoaded = false;
  bool inital = true;

  @override
  Widget build(BuildContext context) {
    if (inital == true) {
      ref
          .watch(commentsProvider.notifier)
          .getAllComments(widget.post.id)
          .then((value) {
        setState(() {
          dataLoaded = true;
          inital = false;
        });
      });
    }
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              // height: 600.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        //! view header the post
                        HeaderThePost(
                          post: widget.post,
                        ),
                        if (widget.post.type == 2)
                          ContentViewPostScreen(post: widget.post),
                        if (widget.post.type == 3)
                          LimitedBox(
                              maxWidth: double.infinity,
                              maxHeight: 400,
                              child: PortraitLandscapePlayerPage(
                                post: widget.post,
                                index: 1,
                              )),

                        Bottom_Post(context, widget.post, ref),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            // !this for build comments
            Container(
                width: double.infinity,
                // height: 600.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: dataLoaded == true
                    ? Column(
                        children: ref
                            .watch(commentsProvider.notifier)
                            .state
                            .map((comment) => buildComment(0, context, comment))
                            .toList())
                    : Loader()
                //
                // buildComment(1,context,null),
                // buildComment(2,context,null),
                // buildComment(3,context,null),
                // buildComment(4,context,null),

                )
          ],
        ),
      ),
      //! this for add comment
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.all(20.0),
                hintText: 'Add a comment',
                prefixIcon: Container(
                  margin: EdgeInsets.all(4.0),
                  width: 48.0,
                  height: 48.0,
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
                        height: 48.0,
                        width: 48.0,
                        image: NetworkImage(widget.post.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 4.0),
                  width: 70.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFF23B66F),
                    onPressed: () => print('Post comment'),
                    child: Icon(
                      Icons.send,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentViewPostScreen extends StatelessWidget {
  ContentViewPostScreen({
    super.key,
    required this.post,
  });

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => print('Like post'),
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

class HeaderViewPostScreen extends StatelessWidget {
  HeaderViewPostScreen({
    super.key,
    required this.post,
  });

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListTile(
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
                    image: NetworkImage(post.content!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              post.content!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                115, 138, 222, 245),
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
          ),
        ),
      ],
    );
  }
}

Widget Bottom_Post(BuildContext context, Posts post, [WidgetRef? refe]) {
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
                    //!likePosts
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: post.amILike > 0 ? Colors.red : Colors.black,
                        ),
                        iconSize: 30.0,
                        onPressed: () {
                          print('Like post');

                          refe!
                              .read(postsProvider.notifier)
                              .addLikeOrUndo(post);
                        }),
                    Text(
                      post.numberLikes.toString(),
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
                      post.numberComments.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark_border,
              ),
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
