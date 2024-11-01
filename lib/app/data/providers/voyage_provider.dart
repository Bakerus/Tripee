import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripee/app/data/models/place_model.dart';

class VoyageProvider {
  String geturlBase(String place) =>
      "https://nominatim.openstreetmap.org/search?q=$place&format=json&addressdetails=1&limit=1&polygon_svg=1&countrycodes=ca";

  List<PlaceModel> parseInfosPlace({required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PlaceModel>((json) => PlaceModel.fromJson(json)).toList();
  }

  Future<List<PlaceModel?>> getInformationsPlace({required place}) async {
    try {
      final response = await http.get(Uri.parse(geturlBase(place)));
      if (response.statusCode == 200) {
        return parseInfosPlace(responseBody: response.body);
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}


/**
 * This file defines the `VoyageProvider` class, which is responsible for fetching and parsing place information 
 * from the OpenStreetMap API, specifically limited to Canadian places.
 *
 * Main functionalities include:
 * 
 * 1. **URL Builder (geturlBase(String place))**: Constructs the API URL using the specified place name for a query.
 * 
 * 2. **Response Parsing (parseInfosPlace({required String responseBody}))**: Converts the API response (JSON format) 
 *    into a list of `PlaceModel` instances, making it easier to handle place information within the app.
 * 
 * 3. **API Call (getInformationsPlace({required place}))**: Executes an HTTP GET request to the OpenStreetMap API to 
 *    retrieve place data based on the provided place name. If the call is successful (HTTP status 200), it returns a 
 *    parsed list of `PlaceModel` instances; otherwise, it returns an empty list. Handles potential errors by throwing 
 *    an exception.
 * 
 * Key variables and methods:
 * - `geturlBase`: Method for constructing the API URL, including query parameters for format and filtering by country code.
 * - `parseInfosPlace`: Method to parse JSON response into `PlaceModel` objects, ensuring that place data is handled in a structured way.
 * - `getInformationsPlace`: Method for executing the API request and handling the response, returning structured place data or an empty list on failure.
 * 
 * The class leverages Dart's `http` package for making HTTP requests and `jsonDecode` for JSON processing.
 */
