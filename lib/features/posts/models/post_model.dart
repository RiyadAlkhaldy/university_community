import 'dart:convert';

class ResponsePosts {
  ResponsePosts({
    required this.status,
    required this.message,
    required this.posts,
  });
  final String status;
  final String message;
  final List<Posts> posts;

  ResponsePosts copyWith({
    String? status,
    String? message,
    List<Posts>? posts,
  }) {
    return ResponsePosts(
      status: status ?? this.status,
      message: message ?? this.message,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'posts': posts,
    };
  }

  factory ResponsePosts.fromMap(Map<String, dynamic> map) {
    return ResponsePosts(
      status: map['status'],
      message: map['message'],
      posts: List.from(map['posts']).map((e) => Posts.fromMap(e)).toList(),
    );
  }
  // void (){
  //   posts.map((posts) => Posts.fromMap( post));

  // }

  String toJson() => json.encode(toMap());

  factory ResponsePosts.fromJson(String source) =>
      ResponsePosts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResponsePosts(status: $status, message: $message, posts: $posts)';

  @override
  bool operator ==(covariant ResponsePosts other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.posts == posts;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ posts.hashCode;
}

class Posts {
  Posts({
    required this.id,
    required this.content,
    required this.type,
    required this.url,
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
  final int id;
  final String content;
  final int type;
  final String? url;
  final int userId;
  final int sectionId;
  final int collogeId;
  final String createdAt;
  final String updatedAt;
  final String collogeName;
  final String sectionName;
  final String name;
  final String img;

  Posts copyWith({
    int? id,
    String? content,
    int? type,
    String? url,
    int? userId,
    int? sectionId,
    int? collogeId,
    String? createdAt,
    String? updatedAt,
    String? collogeName,
    String? sectionName,
    String? name,
    String? img,
  }) {
    return Posts(
      id: id ?? this.id,
      content: content ?? this.content,
      type: type ?? this.type,
      url: url ?? this.url,
      userId: userId ?? this.userId,
      sectionId: sectionId ?? this.sectionId,
      collogeId: collogeId ?? this.collogeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      collogeName: collogeName ?? this.collogeName,
      sectionName: sectionName ?? this.sectionName,
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'type': type,
      'url': url!.isEmpty ? '' : url,
      'user_id': userId,
      'section_id': sectionId,
      'colloge_id': collogeId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'colloge_name': collogeName,
      'section_name': sectionName,
      'name': name,
      'img': img,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id'],
      content: map['content'],
      type: map['type'],
      url: map['url'],
      userId: map['user_id'],
      sectionId: map['section_id'],
      collogeId: map['colloge_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      collogeName: map['colloge_name'],
      sectionName: map['section_name'],
      name: map['name'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts.fromJson(String source) =>
      Posts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Posts(id: $id, content: $content, type: $type, url: $url, userId: $userId, sectionId: $sectionId, collogeId: $collogeId, createdAt: $createdAt, updatedAt: $updatedAt, collogeName: $collogeName, sectionName: $sectionName, name: $name, img: $img)';
  }

  @override
  bool operator ==(covariant Posts other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.type == type &&
        other.url == url &&
        other.userId == userId &&
        other.sectionId == sectionId &&
        other.collogeId == collogeId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.collogeName == collogeName &&
        other.sectionName == sectionName &&
        other.name == name &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        type.hashCode ^
        url.hashCode ^
        userId.hashCode ^
        sectionId.hashCode ^
        collogeId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        collogeName.hashCode ^
        sectionName.hashCode ^
        name.hashCode ^
        img.hashCode;
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

