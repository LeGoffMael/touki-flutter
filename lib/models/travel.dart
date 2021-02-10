import 'package:touki/models/user.dart';
import 'dart:convert';

class Travel {
  int id;
  String title;
  String travelImagePath;
  List<User> users;

  Travel({this.id, this.title, this.travelImagePath, this.users});

  factory Travel.fromJson(Map<String, dynamic> json) {
    final parsed = json['users'].cast<Map<String, dynamic>>();
    List<User> usersList =
        parsed.map<User>((json) => User.fromJson(json)).toList();

    return Travel(
        id: json['id'] as int,
        title: json['title'] as String,
        travelImagePath: json['travelImagePath'] as String,
        users: usersList);
  }
}
