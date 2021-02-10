import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:touki/models/travel.dart';
import 'package:touki/services/travelService.dart';
import 'package:touki/shared/widgets/travels/travelsList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.airplanemode_active),
          title: Text(
            'Touki',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          brightness: Brightness.dark),
      body: Center(
        child: FutureBuilder<List<Travel>>(
          future: TravelService().fetchTravels(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TravelsList(travels: snapshot.data)
                : Center(child: CircularProgressIndicator());

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
