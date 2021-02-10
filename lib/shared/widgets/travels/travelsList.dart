import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:touki/models/travel.dart';
import 'package:touki/shared/widgets/travels/travelCard.dart';
import 'package:touki/shared/widgets/travels/travelDetails.dart';

class TravelsList extends StatelessWidget {
  final List<Travel> travels;

  ClosedCallback<bool> onClosed;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  TravelsList({Key key, this.travels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: travels.length,
      itemBuilder: (context, index) {
        return OpenContainer<bool>(
          transitionType: _transitionType,
          openBuilder: (BuildContext context, VoidCallback openContainer) {
            return TravelDetails(travel: travels[index]);
          },
          onClosed: onClosed,
          tappable: false,
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return TravelCard(
                travel: travels[index], openContainer: openContainer);
          },
        );
      },
    );
  }
}
