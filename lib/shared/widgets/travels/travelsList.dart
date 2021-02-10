import 'package:flutter/material.dart';
import 'package:touki/models/travel.dart';
import 'package:touki/shared/widgets/travels/travelCard.dart';

class TravelsList extends StatelessWidget {
  final List<Travel> travels;

  TravelsList({Key key, this.travels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: travels.length,
      itemBuilder: (context, index) {
        return TravelCard(travel: travels[index]);
      },
    );
  }
}
