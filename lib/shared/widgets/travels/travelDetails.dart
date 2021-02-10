import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touki/models/travel.dart';
import 'package:touki/models/travelStep.dart';
import 'package:touki/shared/widgets/steps/stepStepper.dart';
import 'package:touki/shared/widgets/user/multipleAvatars.dart';
import 'package:touki/services/stepService.dart';

// TODO: close page when slide to bottom
class TravelDetails extends StatelessWidget {
  final Travel travel;

  DateFormat f = new DateFormat('dd MMM yyyy');

  TravelDetails({Key key, this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 300,
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    // In order to have the ink splash appear above the image, you
                    // must use Ink.image. This allows the image to be painted as part
                    // of the Material and display ink effects above it. Using a
                    // standard Image will obscure the ink splash.
                    child: Ink.image(
                      image: Image.network(travel.travelImagePath).image,
                      fit: BoxFit.cover,
                      child: Container(),
                    ),
                  ),
                  Positioned(
                      top: 40.0,
                      left: 16.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )),
                ])),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    travel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'From ' +
                        f.format(travel.startDate).toString() +
                        ' to ' +
                        f.format(travel.endDate).toString(),
                    style: TextStyle(fontSize: 22.0, color: Colors.black87),
                  ),
                  Row(
                    children: [
                      Text(
                        'By: ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black87),
                      ),
                      MultipleAvatars(users: travel.users, limit: false)
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<TravelStep>>(
                future: StepService().fetchStepsByTravel(travel.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? StepStepper(steps: snapshot.data)
                      : Center(child: CircularProgressIndicator());

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
