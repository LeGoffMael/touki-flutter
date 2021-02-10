import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touki/models/travelStep.dart';

class StepService {
  Future<List<TravelStep>> fetchStepsByTravel(int travelId) async {
    final response = await http.get(
        'https://my-json-server.typicode.com/legoffmael/touki-fakedata/travels/' +
            travelId.toString() +
            '/steps');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseSteps(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load steps');
    }
  }

  // A function that converts a response body into a List<TravelStep>.
  List<TravelStep> parseSteps(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<TravelStep>((json) => TravelStep.fromJson(json)).toList();
  }
}
