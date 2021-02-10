import 'package:flutter/material.dart';
import 'package:touki/models/user.dart';

class OverllapedAvatar extends StatelessWidget {
  final List<User> users;
  final overlap = 20.0;
  final items = [
    CircleAvatar(
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 18,
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/women/24.jpg")),
    ),
    CircleAvatar(
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 18,
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/women/25.jpg")),
    ),
    CircleAvatar(
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 18,
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/women/26.jpg")),
    )
  ];

  OverllapedAvatar({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stackLayers =
        // Overlap 3 first users avatars
        List<Widget>.generate(items.getRange(0, 3).length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    if (items.length <= 3)
      return Stack(children: stackLayers.reversed.toList());
    else
      return Row(
        children: [
          Stack(children: stackLayers.reversed.toList()),
          Text("and ${items.length - 3} more"),
        ],
      );
  }
}
