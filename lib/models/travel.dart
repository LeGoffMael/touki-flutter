import 'package:touki/models/user.dart';

class Travel {
  int id;
  String title;
  String travelImagePath;
  List<User> users;

  Travel({this.id, this.title, this.travelImagePath});

  factory Travel.fromJson(Map<String, dynamic> json) {
    return Travel(
      id: json['id'] as int,
      title: json['title'] as String,
      travelImagePath: json['travelImagePath'] as String,
    );
  }
}
