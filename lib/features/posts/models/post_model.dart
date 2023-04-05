class ResponsePosts {
  ResponsePosts({
    required this.posts,
  });
  late final List<Posts> posts;

  ResponsePosts.fromJson(Map<String, dynamic> json) {
    posts = List.from(json['posts']).map((e) => Posts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['posts'] = posts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Posts {
  Posts({
    required this.id,
    this.content,
    required this.type,
    this.url,
    required this.userId,
    required this.sectionId,
    required this.collogeId,
    required this.createdAt,
    required this.updatedAt,
    required this.collogeName,
    required this.sectionName,
    required this.name,
    required this.img,
  });
  late final int id;
  late final String? content;
  late final int type;
  late final String? url;
  late final int userId;
  late final int sectionId;
  late final int collogeId;
  late final String createdAt;
  late final String updatedAt;
  late final String collogeName;
  late final String sectionName;
  late final String name;
  late final String img;

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        id: json['id'],
        content: json['conten'] == null ? 'nullable' : json['content'],
        type: json['type'],
        url: json['url'],
        userId: json['user_id'],
        sectionId: json['section_id'],
        collogeId: json['colloge_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        collogeName: json['colloge_name'],
        sectionName: json['section_name'],
        name: json['name'],
        img: json['img']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['content'] = content;
    _data['type'] = type;
    _data['url'] = url;
    _data['user_id'] = userId;
    _data['section_id'] = sectionId;
    _data['colloge_id'] = collogeId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['colloge_name'] = collogeName;
    _data['section_name'] = sectionName;
    _data['name'] = name;
    _data['img'] = img;
    return _data;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

// class Post {
//   String authorName;
//   String authorImageUrl;
//   String timeAgo;
//   String imageUrl;
//   String videoUrl;
//   int type;

//   Post({
//     required this.authorName,
//     required this.authorImageUrl,
//     required this.timeAgo,
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.type,
//   });
// }

// final List<Post> postss = [
//   Post(
//     authorName: 'Sam Martin',
//     authorImageUrl: 'assets/images/user0.png',
//     timeAgo: '5 min',
//     imageUrl: 'assets/images/post0.jpg',
//     type: 1,
//     videoUrl:
//         'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
//   ),
//   Post(
//     authorName: 'Sam Martin',
//     authorImageUrl: 'assets/images/user0.png',
//     timeAgo: '10 min',
//     imageUrl: 'assets/images/post1.jpg',
//     type: 1,
//     videoUrl:
//         'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
//   ),
//   Post(
//     authorName: 'Sam Martin',
//     authorImageUrl: 'assets/images/user0.png',
//     timeAgo: '10 min',
//     imageUrl: 'assets/images/post1.jpg',
//     type: 0,
//     videoUrl:
//         'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
//   ),
//   Post(
//     authorName: 'Sam Martin',
//     authorImageUrl: 'assets/images/user0.png',
//     timeAgo: '10 min',
//     imageUrl: 'assets/images/post1.jpg',
//     type: 0,
//     videoUrl:
//         'https://player.vimeo.com/external/201962441.hd.mp4?s=d5e09fbd67593c9796cfba4d273bfca4d8a828f9&profile_id=174&oauth2_token_id=57447761',
//   ),
// ];

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
// final posts = FutureProvider<List<Post>>((ref) async {
//   return postss;
// });



/////
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

