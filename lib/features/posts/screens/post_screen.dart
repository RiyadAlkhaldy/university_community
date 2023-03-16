import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/core/utils/loader.dart';
import 'package:untitled/features/posts/models/post_model.dart';
import 'package:untitled/features/posts/screens/view_post_screen.dart';
import 'package:untitled/features/posts/widgets/build_post.dart';
import 'package:untitled/features/setting/screens/setting_screen.dart';
import 'package:untitled/features/user/presentation/pages/user_profile_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            PostHeader(),
            Container(
              width: double.infinity,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 10.0);
                  }
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
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
                          height: 60.0,
                          width: 60.0,
                          image: AssetImage(stories[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // pos.when(
            //   data: (data) => Column(
            //       children: data
            //           .map((e) => buildPost(
            //                 index: 0,
            //                 contextl: context,
            //                 post: e,
            //               ))
            //           .toList()

            //       // childCount: data.length,
            //       ),
            //   error: (error, stackTrace) => Text("error"),
            //   loading: () => const Loader(),
            // ),
            Consumer(
              builder: (context, ref, child) {
                final pos = ref.watch(posts);
                return pos.when(
                  data: (data) => Column(
                      children: data
                          .map((e) => buildPost(
                                index: 0,
                                contextl: context,
                                post: e,
                              ))
                          .toList()

                      // childCount: data.length,
                      ),
                  error: (error, stackTrace) => Text("error"),
                  loading: () => const Loader(),
                );
              },
            ),
            // buildPost(index: 0, contextl: context),
            // buildPost(index: 1, contextl: context),
            // buildPost(index: 0, contextl: context),

            // buildPost(index: 1, contextl: context),
            // buildPost(index: 0, contextl: context),
          ]),

          // ],
        ),
      ],
    );
  }

  Widget PostHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Instagram',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 32.0,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.live_tv),
                iconSize: 30.0,
                onPressed: () => print('IGTV'),
              ),
              SizedBox(width: 16.0),
              Container(
                width: 35.0,
                child: IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 30.0,
                  onPressed: () => print('Direct Messages'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
