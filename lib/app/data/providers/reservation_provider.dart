import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:tripee/app/data/models/reservation_request_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/data/models/reservation_trajet_model.dart';

class ReservationPrider {
  static String host = IdentifiantsConnectionsToBackend.host;
  static int port = IdentifiantsConnectionsToBackend.port;
  static String path = "reservations";

  List<ReservationResponseModel> parseInfosSearch(
      {required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ReservationResponseModel>(
            (json) => ReservationResponseModel.fromJson(json))
        .toList();
  }

  Future<dynamic> postReservation(
      ReservationRequestModel reservation, String token,
      {String action = "create"}) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/$action");
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'reservedPlaces': reservation.reservedPlaces,
            'price': reservation.price,
            'hasLuggage': reservation.hasLuggage,
            'userId': reservation.userId,
            'rideId': reservation.rideId,
          }));
      if (response.statusCode == 201) {
        return ReservationTrajet.fromJson(jsonDecode(response.body));
      } else {
        return ErrorModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<List<ReservationResponseModel>> getAllReservationtByUser(
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

  Future<List<ReservationResponseModel>> getAllReservationtByRide(
      String rideId, String token,
      {String action = "all"}) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$path/ride/$rideId/$action");
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

  Future<void> deleteReservation(
    int reservationId,
    String token,
  ) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$path/delete/$reservationId");
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

/*

- `parseInfosSearch`: Decodes the response body JSON string into a list of `ReservationResponseModel` objects for easier use within the app.
  
- `postReservation`: This asynchronous method posts a reservation request to the server. It sends necessary fields (such as `reservedPlaces`, `price`, `hasLuggage`, etc.) as JSON, using a bearer token for authorization. If successful, it returns a `ReservationTrajet` object; otherwise, it returns an `ErrorModel`.

- `getAllReservationtByUser`: This function retrieves all reservations associated with a specific user by their `userId`. It makes an HTTP GET request to a specified endpoint using a bearer token. If successful, it returns a list of `ReservationResponseModel`; otherwise, an empty list is returned.

- `getAllReservationtByRide`: Similar to `getAllReservationtByUser`, this function retrieves all reservations related to a specific ride, using `rideId`. It returns a list of `ReservationResponseModel` or an empty list if the request fails.

- `deleteReservation`: Deletes a reservation using its `reservationId`. This function uses an HTTP DELETE request, with a bearer token required for authorization.

- Error Handling: Each method uses a `try-catch` block to handle network or server exceptions and throws the caught exception message if an error occurs.
*/