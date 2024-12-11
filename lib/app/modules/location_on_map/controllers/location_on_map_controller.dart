import 'dart:async';
import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripee/app/data/providers/message_provider.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class LocationOnMapController extends GetxController {
  Map<String, dynamic>? userInfo;
  final conversationExist = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
  }

  final mapController = Completer<GoogleMapController>().obs;
  MessageProvider messageProvider = MessageProvider();
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();

  RxMap<PolylineId, Polyline> polylines = RxMap();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  final initialCameraPosition =
      const CameraPosition(target: LatLng(37.4, -122.0), zoom: 13.0).obs;
  static const departurePosition = LatLng(37.4, -122.0);
  static const arrivalPosition = LatLng(37.5, -122.0);

  final placeDepature = Marker(
          markerId: const MarkerId("placeDepature"),
          position: departurePosition,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen))
      .obs;
  final placeArrival = Marker(
          markerId: const MarkerId("placeArrival"),
          position: arrivalPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
      .obs;

  checkExistConversation(
      {required String convId,
      required int userId,
      required String username,
      required int interlocutorId,
      required String interlocutorName}) async {
    conversationExist.value =
        await messageProvider.getCheckConversation(convId);
  }

  createConversation(
      {required String convId,
      required int userId,
      required String username,
      required int interlocutorId,
      required String interlocutorName}) async {
    await messageProvider.postConversation(
        convId, userId, username, interlocutorId, interlocutorName);
  }

  startRide(String token, int rideId, {String actions = "startRide"}) {
    publicationTrajetProvider.updateTrajetStatut(actions, rideId, token);
  }
    terminateRide(String token, int rideId, {String actions = "terminateRide"}) {
    publicationTrajetProvider.updateTrajetStatut(actions, rideId, token);
  }


  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
/**
 * This file defines the `LocationOnMapController` class, which manages map functionalities, polyline routes,
 * and conversation handling within the `Tripee` application.
 * It leverages the GetX package for state management and Google Maps for displaying map and route data.
 * 
 * Main functionalities include:
 * 1. `onInit` - Initializes user information from a local file upon controller initialization.
 * 2. Map Setup:
 *    - `mapController`: A Completer that will eventually hold the GoogleMapController to control map actions.
 *    - `initialCameraPosition`: The default starting position for the map camera.
 *    - `placeDeparture` and `placeArrival`: Markers representing the starting and ending points on the map.
 * 3. Polyline Routing:
 *    - `polylines`: A reactive map that stores polyline data used for routes.
 *    - `polylineCoordinates`: List to store the points along the polyline path.
 *    - `polylinePoints`: Helper from the `flutter_polyline_points` package to create polyline routes.
 *    - nb: For this version we were unable to implement polylines due to a lack of resources (invalid bankcards).
 * 4. Conversation Handling:
 *    - `checkExistConversation`: Checks if a conversation already exists for a given conversation ID using 
 *       the `MessageProvider`.
 *    - `createConversation`: Initiates a new conversation if none exists with the specified parameters.
 * 5. `readUserInformations` - Reads and parses user information from a locally stored file using 
 *    the `LocalFileServices` class.
 * 
 * Key details:
 * - The controller maintains the map state reactively (e.g., markers and polylines) to enable real-time updates.
 * - The `MessageProvider` and `LocalFileServices` are used to handle messaging and file operations respectively.
 * - Polyline data is essential for displaying routes between locations on the map.
 */
