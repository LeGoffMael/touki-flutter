import 'package:flutter/material.dart';
import 'package:touki/models/travel.dart';
import 'package:touki/shared/widgets/user/multipleAvatars.dart';

class TravelCard extends StatelessWidget {
  final Travel travel;
  final VoidCallback openContainer;

  TravelCard({Key key, this.travel, this.openContainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // This ensures that the Card's children (including the ink splash) are clipped correctly.
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
          height: 184.0,
          child: InkWell(
            onTap: openContainer,
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
                // Gradient to make text more visible
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black54,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                ),
                // Add text on image card
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
                        MultipleAvatars(users: travel.users, limit: true)
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
