import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/expedition_model.dart';
import 'package:tripee/app/data/models/expedition_response_model.dart';

class ExpeditionProvider {
  static String host = IdentifiantsConnectionsToBackend.host;
  static int port = IdentifiantsConnectionsToBackend.port;
  static String path = "expeditions";

  Future<dynamic> postExpedition(ExpeditionModel expedition, String token,
      {String action = "save"}) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/$action");
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'price': expedition.price,
            'emailToContact': expedition.emailToContact,
            'packet': expedition.packet?.toJson(),
            'userId': expedition.userId,
            'rideId': expedition.rideId,
          }));
      if (response.statusCode == 201) {
        return ExpeditionModel.fromJson(jsonDecode(response.body));
      } else {
        return ErrorModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  List<ExpeditionResponseModel> parseInfosSearch(
      {required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ExpeditionResponseModel>(
            (json) => ExpeditionResponseModel.fromJson(json))
        .toList();
  }

  Future<List<ExpeditionResponseModel>> getAllExpeditionByUser(
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

  Future<void> deleteExpedition(
    int expeditionId,
    String token,
  ) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$path/delete/$expeditionId");
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
}

/**
 * This file defines the `ExpeditionProvider` class, which manages HTTP requests for expedition-related actions.
 * It uses the `http` package to communicate with the backend API, handling operations such as creating, 
 * retrieving, and deleting expedition records.
 * 
 * Main functionalities include:
 * 1. `postExpedition` - Sends a POST request to create a new expedition record with details such as price, contact email, 
 *    packet details, and associated user and ride IDs.
 * 2. `parseInfosSearch` - Parses the JSON response body into a list of `ExpeditionResponseModel` objects.
 * 3. `getAllExpeditionByUser` - Retrieves all expeditions associated with a specific user by making a GET request.
 * 4. `deleteExpedition` - Sends a DELETE request to remove a specified expedition by ID.
 * 
 * Key details:
 * - The API host and port are specified in `IdentifiantsConnectionsToBackend.host` and `IdentifiantsConnectionsToBackend.port`.
 * - The base path for expedition-related operations is `expeditions`.
 * - Each request includes an authorization token for secured access.
 * - Expedition data (e.g., price, packet info) is serialized as JSON before being sent in the request body.
 * 
 * Nb: Each function in the provider is named to reflect its operation (e.g., `post` for POST requests).
 */
