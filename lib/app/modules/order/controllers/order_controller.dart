import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class OrderController extends GetxController {
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  final lieuDepart = ''.obs;
  final lieuArrive = ''.obs;
  Map<String, dynamic>? userInfo;
  Future<List<ResponsePublicationTrajetModel>>? trajectList;
  final searching = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
  }

  searchTrajet(String lieuDepart, String lieuArrive, String token) async {
    trajectList = publicationTrajetProvider.getTrajet(
        lieuDepart.replaceAll(" ", "").toLowerCase(),
        lieuArrive.replaceAll(" ", "").toLowerCase(),
        token);
    searching.value = true;
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
 * This file defines the `OrderController` class, responsible for managing the process of searching for 
 * available journeys or trips in the application. It uses data models and providers to fetch relevant 
 * trip details and handles user-specific information.
 *
 * Main functionalities include:
 *
 * 1. **Fetching and Displaying Available Trips (searchTrajet)**:
 *    - The `searchTrajet` method triggers a search based on the user's entered departure (`lieuDepart`) and 
 *      arrival (`lieuArrive`) locations. 
 *    - It utilizes `PublicationTrajetProvider` to fetch data and stores the results in `trajectList`.
 *    - The `searching` variable is set to `true` during the search, allowing the UI to respond to this state.
 *
 * 2. **User Information Management (readUserInformations)**:
 *    - The `readUserInformations` method retrieves locally stored user data via `LocalFileServices`. 
 *    - This data can include details like the user’s token, which is required for making authenticated requests.
 *
 * Key variables and methods:
 * - `lieuDepart`, `lieuArrive`: Reactive variables for the departure and arrival locations entered by the user.
 * - `userInfo`: Holds information about the current user, such as authentication details.
 * - `trajectList`: Stores the list of trips returned from the API after a successful search.
 * - `searching`: Indicates whether a search operation is currently active, helping to manage loading states.
 * - `searchTrajet`: Initiates the trip search based on departure and arrival locations, updating `trajectList`.
 *
 * This controller takes advantage of GetX's reactivity, allowing the UI to automatically reflect changes in 
 * the search status and trip list as they update, making the search experience dynamic and responsive.
 */
