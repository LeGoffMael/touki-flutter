import 'package:touki/models/geoDAta.dart';

class TravelStep {
  int id;
  String city;
  String country;
  int travelId;
  DateTime startDate;
  DateTime endDate;
  GeoData geo;

  TravelStep(
      {this.id,
      this.city,
      this.country,
      this.travelId,
      this.startDate,
      this.endDate,
      this.geo});

  factory TravelStep.fromJson(Map<String, dynamic> json) {
    return TravelStep(
        id: json['id'] as int,
        city: json['city'] as String,
        country: json['country'] as String,
        travelId: json['travelId'] as int,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        geo: GeoData.fromJson(json['geo']));
  }
}
