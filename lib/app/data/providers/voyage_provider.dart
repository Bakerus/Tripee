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

  Future<List<PlaceModel?>> getInformationsPlace(
      {required place, required bool state}) async {
    try {
      final response = await http.get(Uri.parse(geturlBase(place)));
      if (response.statusCode == 200) {
        if (state == false) {
          //Point d'arrivé
          return parseInfosPlace(responseBody: response.body);
        } else {
          //Point de depart
          return parseInfosPlace(responseBody: response.body);
        }
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
