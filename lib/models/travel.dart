import 'package:touki/models/user.dart';
import 'dart:convert';

class Travel {
  int id;
  String title;
  String travelImagePath;
  DateTime startDate;
  DateTime endDate;
  List<User> users;

  Travel(
      {this.id,
      this.title,
      this.travelImagePath,
      this.startDate,
      this.endDate,
      this.users});

  factory Travel.fromJson(Map<String, dynamic> json) {
    final parsed = json['users'].cast<Map<String, dynamic>>();
    List<User> usersList =
        parsed.map<User>((json) => User.fromJson(json)).toList();

    return Travel(
        id: json['id'] as int,
        title: json['title'] as String,
        travelImagePath: json['travelImagePath'] as String,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        users: usersList);
  }
}
