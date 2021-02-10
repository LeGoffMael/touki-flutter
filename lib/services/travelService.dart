import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:touki/models/travel.dart';

class TravelService {
  Future<List<Travel>> fetchTravels() async {
    final response = await http.get(
        'https://my-json-server.typicode.com/legoffmael/touki-fakedata/travels');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseTravels(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load travels');
    }
  }

  // A function that converts a response body into a List<Travel>.
  List<Travel> parseTravels(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Travel>((json) => Travel.fromJson(json)).toList();
  }
}
