import 'package:flutter/material.dart';

import '../models/comment_model.dart';

Widget buildComment(int index, BuildContext context, Comments comment) {
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
      title: Text(comment.comment,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(
        comments[index].text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black, fontSize: 16),
      ),
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
