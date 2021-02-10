import 'package:flutter/material.dart';
import 'package:touki/models/user.dart';

class MultipleAvatars extends StatelessWidget {
  final List<User> users;
  final bool limit;
  final overlap = 20.0;

  MultipleAvatars({Key key, this.users, this.limit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(users[0].firstName);

    List<Widget> stackLayers =
        // Overlap only 3 first users avatars if limit is set to true
        List<Widget>.generate(
            users
                .getRange(0, limit && users.length >= 3 ? 3 : users.length)
                .length, (index) {
      return Padding(
          padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
          child: Tooltip(
            message: users[index].userName,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(users[index].profileImagePath)),
            ),
          ));
    });

    if (users.length <= 3 || !limit)
      return Stack(children: stackLayers.reversed.toList());
    else
      return Row(
        children: [
          Stack(children: stackLayers.reversed.toList()),
          Text(
            "+",
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
  }
}
