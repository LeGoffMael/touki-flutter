import 'package:touki/models/travel.dart';

class User {
  int id;
  String username;
  String profileImagePath;
  List<Travel> travels;

  User({
    this.id,
    this.username,
    this.profileImagePath,
  });
}
