import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/features/user/data/models/user_post_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Profile {
  final int id;
  final String name;
  final String address;
  final DateTime birthDate;
  final String descrption;
  final String image;
  final DateTime joinIN;
  Profile({
    required this.id,
    required this.name,
    required this.address,
    required this.birthDate,
    required this.descrption,
    required this.image,
    required this.joinIN,
  });
}

//--------
class Student {
  final int id;
  final String name;
  final String address;
  final DateTime birthDate;
  final String descrption;
  final String image;
  final DateTime joinIN;
  final String department;
  final String colloge;
  final String level;
  final List<UserPostModel> userPostModel;
  Student({
    required this.id,
    required this.name,
    required this.address,
    required this.birthDate,
    required this.descrption,
    required this.image,
    required this.joinIN,
    required this.department,
    required this.colloge,
    required this.level,
    required this.userPostModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'descrption': descrption,
      'image': image,
      'joinIN': joinIN.millisecondsSinceEpoch,
      'section': department,
      'colloge': colloge,
      'level': level,
      'userPostModel': userPostModel,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      descrption: map['descrption'] as String,
      image: map['image'] as String,
      joinIN: DateTime.fromMillisecondsSinceEpoch(map['joinIN'] as int),
      department: map['section'] as String,
      colloge: map['colloge'] as String,
      level: map['level'] as String,
      userPostModel: map['userPostModel'] as List<UserPostModel>,
    );
  }
}

final userStudent = FutureProvider<Student>((ref) {
  return Student.fromMap(student.toMap());
});
Student student = Student(
  id: 190374,
  name: 'Reyath Alkhlady',
  address: "Heziz",
  birthDate: DateTime(1997, 5, 21),
  descrption: "Student in alandels univercity",
  image:
      "https://scontent.fsah2-1.fna.fbcdn.net/v/t1.6435-1/57393193_1132886270231502_7647128569755205632_n.jpg?stp=dst-jpg_p240x240&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_ohc=OA9tCpxUYpoAX_qS5aI&_nc_ht=scontent.fsah2-1.fna&oh=00_AfDLQrjoGMs3vRv6e1XS7MZXEwg2Gjwe9fJTY2V7PrEMcw&oe=63D6F5CF",
  joinIN: DateTime(2023),
  department: "Information Technulgy",
  colloge: "Engineering",
  level: "Forth",
  userPostModel: listUserPosstModel,
);
