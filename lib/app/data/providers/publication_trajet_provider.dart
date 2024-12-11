import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';

class PublicationTrajetProvider {
  static String host = IdentifiantsConnectionsToBackend.host;
  static int port = IdentifiantsConnectionsToBackend.port;
  static String path = "rides";

  List<ResponsePublicationTrajetModel> parseInfosSearch(
      {required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ResponsePublicationTrajetModel>(
            (json) => ResponsePublicationTrajetModel.fromJson(json))
        .toList();
  }

  Future<bool> postTrajet(
      String publicationTrajetModel, String imagePath, String token,
      {String action = "save"}) async {
    var request = http.MultipartRequest('POST',
        Uri(scheme: "http", host: host, port: port, path: "$path/$action"));
    request.headers.addAll({"Authorization": "Bearer $token"});
    request.files
        .add(await http.MultipartFile.fromPath('vehicleImage', imagePath));
    request.fields['rideRequest'] = publicationTrajetModel;
    var response = await request.send();
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ResponsePublicationTrajetModel>> getTrajet(
      String lieuDepart, String lieuArrive, String token,
      {String action = "search"}) async {
    var url = Uri.parse(
        "http://$host:8089/rides/search?departurePlace=$lieuDepart&arrivalPlace=$lieuArrive");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return parseInfosSearch(responseBody: response.body);
      } else {
        return [];
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<List<ResponsePublicationTrajetModel>> getAllTrajetByUser(
      String userId, String token,
      {String action = "all"}) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$path/user/$userId/$action");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return parseInfosSearch(responseBody: response.body);
      } else {
        return [];
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<dynamic> getUserInformationsbytrajet(
    String rideId,
    String token,
  ) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/id/$rideId");

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return ResponsePublicationTrajetModel.fromJson(
            jsonDecode(response.body));
      } else {
        return ErrorModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<void> deleteTrajet(
    int rideId,
    String token,
  ) async {
    var url = Uri(
        scheme: "http", host: host, port: port, path: "$path/delete/$rideId");
    try {
      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<void> updateTrajetStatut(
    String actions,
    int rideId,
    String token,
  ) async {
    var url = Uri(
        scheme: "http", host: host, port: port, path: "$path/$actions/$rideId");
    try {
      final response = await http.put(url,
          body: jsonEncode(<String, dynamic>{
            'idRide': rideId,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
    } catch (e) {
      throw "Exception :$e";
    }
  }
}




// The PublicationTrajetProvider class handles all HTTP requests related to the "rides" feature in the application, including posting, fetching, and deleting rides.
// host, port, and path are constants initialized with backend connection details and the base endpoint path for "rides."
// parseInfosSearch method: Parses the response body from JSON into a list of ResponsePublicationTrajetModel objects.
// postTrajet method: Sends a POST request to publish a ride, including the ride model and vehicle image file, with authorization in the header.
// getTrajet method: Sends a GET request to retrieve rides based on departure and arrival locations, returning a list of parsed ride models if the response is successful, or an empty list otherwise.
// getAllTrajetByUser method: Fetches all rides posted by a specific user based on userId, with authentication via a token. Returns the parsed list of rides or an empty list on failure.
// getUserInformationsbytrajet method: Retrieves specific user details for a particular ride ID, returning a ResponsePublicationTrajetModel if successful or an ErrorModel if there’s an error response.
// deleteTrajet method: Deletes a specific ride identified by rideId, using the DELETE HTTP method, with no action required on a successful response.