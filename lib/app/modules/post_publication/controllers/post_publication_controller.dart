import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/providers/reservation_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class PostPublicationController extends GetxController {
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  Future<List<ResponsePublicationTrajetModel>>? trajectList;
  ReservationPrider reservationPrider = ReservationPrider();
  Future<List<ReservationResponseModel>>? reserVationsList;
  Map<String, dynamic>? userInfo;

  final searching = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    await fethAllTrajetUser(userInfo!["userId"], userInfo!["token"]);
  }

  Future<List<ResponsePublicationTrajetModel>>? fethAllTrajetUser(
      String userId, String token) {
    trajectList = publicationTrajetProvider.getAllTrajetByUser(userId, token);
    searching.value = true;
    return trajectList;
  }

  deleteTrajetById(int rideId, String token) async {
    await publicationTrajetProvider.deleteTrajet(rideId, token);
    searching.value = false;
    await fethAllTrajetUser(userInfo!["userId"], userInfo!["token"]);
    searching.value = true;
  }

  checkDemandReservation(String rideId, String token) {
    reserVationsList =
        reservationPrider.getAllReservationtByRide(rideId, token);
  }

  String parseStatut(statut) {
    if (statut == "ON_HOLD") {
      return "En attente";
    } else if (statut == "IN_PROGRESS") {
      return "En cours";
    } else if (statut == "TERMINATED") {
      return "Terminé";
    } else {
      return "";
    }
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
 * This file defines the `PostPublicationController` class, which is responsible for managing 
 * the user's published trajectories and their statuses in the application.
 *
 * Key functionalities include:
 *
 * 1. **Initialization and User Data Retrieval (onInit)**:
 *    - The `onInit` method is used to:
 *      - Retrieve user information by calling the `readUserInformations` method.
 *      - Initialize the list of trajectories for the current user by invoking `fethAllTrajetUser` 
 *        with the user's ID and token, ensuring that the list reflects all published trajectories.
 *
 * 2. **Fetching User's Published Trajectories (fethAllTrajetUser)**:
 *    - The `fethAllTrajetUser` method retrieves a list of all trajectories published by the current user 
 *      from `PublicationTrajetProvider`. 
 *    - It updates `trajectList` with the fetched list and sets `searching` to `true`, indicating 
 *      that a fetch operation is in progress.
 *    - This ensures that the user sees an updated list of their published trajectories.
 *
 * 3. **Parsing Trajectory Status (parseStatut)**:
 *    - The `parseStatut` method converts the trajectory status from English keys to user-friendly 
 *      French strings:
 *      - "ON_HOLD" → "En attente"
 *      - "IN_PROGRESS" → "En cours"
 *      - "TERMINATED" → "Terminé"
 *    - This parsed status is used for displaying trajectory states in the UI.
 *
 * 4. **User Information Retrieval (readUserInformations)**:
 *    - The `readUserInformations` method reads user data from a local file using `LocalFileServices`.
 *    - It returns user information in JSON format, allowing the controller to access necessary 
 *      credentials (e.g., user ID and token) for data fetching.
 *
 * Key variables and properties:
 * - `publicationTrajetProvider`: Instance of `PublicationTrajetProvider` for accessing publication data.
 * - `trajectList`: Holds the list of trajectories published by the user.
 * - `userInfo`: Stores the user's information such as ID and token, retrieved during initialization.
 * - `searching`: A reactive boolean variable indicating whether the fetch operation is in progress.
 *
 * The `PostPublicationController` manages user-specific trajectory data, making it easy to 
 * display and track the status of published routes, while ensuring user-friendly status descriptions.
 */
