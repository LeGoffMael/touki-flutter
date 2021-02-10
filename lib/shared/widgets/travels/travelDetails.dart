import 'package:flutter/material.dart';
import 'package:touki/models/travel.dart';

class TravelDetails extends StatelessWidget {
  final Travel travel;

  TravelDetails({Key key, this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(travel.title),
        ),
        body: SizedBox(child: Image.network(travel.travelImagePath)));
  }
}
