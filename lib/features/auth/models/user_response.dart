class UserResponseLogin {
  UserResponseLogin({
    required this.status,
    required this.message,
    required this.user,
    required this.authorisation,
  });
  late final String status;
  late final String message;
  late final User user;
  late final Authorisation authorisation;

  UserResponseLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = User.fromJson(json['user']);
    authorisation = Authorisation.fromJson(json['authorisation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['user'] = user.toJson();
    _data['authorisation'] = authorisation.toJson();
    return _data;
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.idNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String name;
  late final String email;
  late final String idNumber;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    idNumber = json['id_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['id_number'] = idNumber;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}

class Authorisation {
  Authorisation({
    required this.token,
    required this.type,
  });
  late final String token;
  late final String type;

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['type'] = type;
    return _data;
  }
}
