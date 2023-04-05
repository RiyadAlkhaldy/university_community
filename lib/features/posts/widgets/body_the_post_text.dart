// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:untitled/features/posts/models/post_model.dart';

import '../screens/view_post_screen.dart';

class BodyThePostText extends StatefulWidget {
  final Posts post;
  final int index;
  BodyThePostText({
    Key? key,
    required this.post,
    required this.index,
  }) : super(key: key);

  @override
  State<BodyThePostText> createState() => _BodyThePostTextState();
}

class _BodyThePostTextState extends State<BodyThePostText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => print('Like post'),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => ViewPostScreen(
        //       post: post,
        //     ),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: 200.0,
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
        child: Container(
            child: Text(
          'jlaflasjfl;asj;fffffffffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjasklffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjasklffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjasklffffffffffflafdj;dal     ffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjasklffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjaskl  sjdlfasfioawlfnajosfdlaj;fasnkfdjasklffffffffffflafdj;dal       sjdlfasfioawlfnajosfdlaj;fasnkfdjaskldfjaskfjanCurfjlaasfjlksljsflafcffffffffffffffffffffffffffffffffffffffalssssssssssssfal;sejf;lasf;asffffffffffffffflasflsflllll',
          // overflow: TextOverflow.ellipsis,
          maxLines: 4,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.5,
                overflow: TextOverflow.ellipsis,
              ),
        )),
      ),
    );
  }
}
