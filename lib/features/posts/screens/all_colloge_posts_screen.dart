import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/core/utils/loader.dart';
import 'package:untitled/features/posts/widgets/build_post.dart';

// import '../controller/posts_controlller.dart';
import '../models/post_model.dart';
import '../repository/repository_colloge_posts.dart';
// import '../repository/repository_posts.dart';

class AllCollogePostsScreen extends ConsumerStatefulWidget {
  AllCollogePostsScreen({
    super.key,
  });

  @override
  ConsumerState<AllCollogePostsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<AllCollogePostsScreen> {
  bool dataLoaded = false;
  bool inital = true;
  @override
  Widget build(BuildContext context) {
    // final posts =
    if (inital == true) {
      ref.watch(collogePostsProvider.notifier).getAllCollogePosts.then((value) {
        setState(() {
          dataLoaded = true;
          inital = false;
        });
      });
    }

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
              child: ListView(
                  scrollDirection: Axis.horizontal, children: [NewWidget()]),
            ),
            dataLoaded == true
                ? Column(
                    children: ref
                        .watch(collogePostsProvider)
                        .map((p) => buildPost(
                              index: 0,
                              contextl: context,
                              post: p,
                            ))
                        .toList()

                    // childCount: data.length,
                    )
                : Loader(),
            // postss.when
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

class NewWidget extends StatelessWidget {
  NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            image: AssetImage(stories[1]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
