import 'package:flutter/material.dart';
import 'package:untitled/features/posts/models/comment_model.dart';
import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/posts/widgets/bottom_post.dart';
import 'package:untitled/features/video/orientation/portrait_landscape_player_page.dart';
import 'package:untitled/features/video/orientation/portrait_player_widget.dart';

class ViewPostScreen extends StatelessWidget {
  static const String routeName = "view-post-screen";
  final Posts post;

  ViewPostScreen({required this.post});

  Widget _buildComment(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
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
                image: AssetImage(comments[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comments[index].authorName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(comments[index].text),
        trailing: IconButton(
          icon: Icon(
            Icons.favorite_border,
          ),
          color: Colors.grey,
          onPressed: () => print('Like comment'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 600.0,
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
                        HeaderViewPostScreen(post: post),
                        if (post.type == 2) ContentViewPostScreen(post: post),
                        if (post.type == 3)
                          LimitedBox(
                              maxWidth: double.infinity,
                              maxHeight: 400,
                              child: PortraitLandscapePlayerPage(
                                post: post,
                                index: 1,
                              )),

                        BottomPost(context, post),
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
              child: Column(
                children: <Widget>[
                  _buildComment(0),
                  _buildComment(1),
                  _buildComment(2),
                  _buildComment(3),
                  _buildComment(4),
                ],
              ),
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
                        image: NetworkImage(post.url!),
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
