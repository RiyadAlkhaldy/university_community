// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String videoUrl;
  int type;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
    required this.videoUrl,
    required this.type,
  });
}

final List<Post> postss = [
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
    type: 1,
    videoUrl:
        'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
    type: 1,
    videoUrl:
        'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
    type: 0,
    videoUrl:
        'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
    type: 0,
    videoUrl:
        'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
  ),
];

final List<String> stories = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
  'assets/images/user0.png',
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
];
final posts = FutureProvider<List<Post>>((ref) async {
  return postss;
});
// class Requsetes {
// final url = "https://facebookgraphapiserg-osipchukv1.p.rapidapi.com/getProfile";
// final headers = {
//        "content-type": "application/x-www-form-urlencoded",
// 	"X-RapidAPI-Key": "8fe4651a6dmsh17e6a305bb289a1p1620d5jsnd9cc6d38692c",
// 	"X-RapidAPI-Host": "FacebookGraphAPIserg-osipchukV1.p.rapidapi.com"
//       };
//   getpost() async {
//    var resposne = await http.post(
//       Uri.parse(url),
//       headers: headers,
//     );
//   }
// }



// payload = "profile_id=%3CREQUIRED%3E&access_token=%3CREQUIRED%3E"
 

// response = requests.request("POST", url, data=payload, headers=headers)

