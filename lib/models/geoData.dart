class GeoData {
  double lat;
  double long;

  GeoData({
    this.lat,
    this.long,
  });

  factory GeoData.fromJson(Map<String, dynamic> json) {
    return GeoData(
      lat: json['lat'] as double,
      long: json['long'] as double,
    );
  }
}
