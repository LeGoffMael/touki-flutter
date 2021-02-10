import 'package:flutter/material.dart';
import 'package:touki/models/travel.dart';
import 'package:touki/shared/widgets/travels/travelDetails.dart';
import 'package:touki/shared/widgets/user/overlappedAvatar.dart';

class TravelCard extends StatelessWidget {
  final Travel travel;

  TravelCard({Key key, this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // This ensures that the Card's children (including the ink splash) are clipped correctly.
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          print('TravelCard ' + travel.id.toString() + ' was tapped');

          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return TravelDetails(travel: travel);
          }));
        },
        // Generally, material cards use onSurface with 12% opacity for the pressed state.
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        // Generally, material cards do not have a highlight overlay.
        highlightColor: Colors.transparent,
        child: SizedBox(
          height: 184.0,
          child: Stack(
            children: <Widget>[
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
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                travel.title,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                '25th Sept to 7th Nov 2020',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              )
                            ],
                          )),
                      OverllapedAvatar()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
