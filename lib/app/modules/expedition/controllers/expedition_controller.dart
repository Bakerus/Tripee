import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/expedition_model.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/data/providers/expedition_provider.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class ExpeditionController extends GetxController {
  final selectedDate = DateTime.now().obs;
  ExpeditionProvider expeditionProvider = ExpeditionProvider();
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  ExpeditionModel expeditionModel = ExpeditionModel();
  final packeDescription = ''.obs;
  final packeHeight = "".obs;
  final packeWeight = "".obs;
  final packeLength = "".obs;
  final packeWidth = "".obs;
  final packePrice = "".obs;
  final emailDestinataire = "".obs;
  final lieuDepart = ''.obs;
  final lieuArrive = ''.obs;
  Map<String, dynamic>? userInfo;
  Future<List<ResponsePublicationTrajetModel>>? trajectList;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
  }

  getExpeditionInfos() {
    expeditionModel = ExpeditionModel(
        price: double.parse(packePrice.value),
        emailToContact: emailDestinataire.value,
        userId: int.parse(userInfo!["userId"]),
        packet: Packet(
            description: packeDescription.value,
            weight: double.parse(packeWeight.value),
            length: double.parse(packeLength.value),
            width: double.parse(packeWidth.value),
            height: double.parse(packeHeight.value)));
  }

  searchTrajet(String lieuDepart, String lieuArrive, String token) async {
    trajectList = publicationTrajetProvider.getTrajet(
        lieuDepart.replaceAll(" ", "").toLowerCase(),
        lieuArrive.replaceAll(" ", "").toLowerCase(),
        token);
  }

  demandExportPacket(ExpeditionModel expedition, String token) {
    expeditionProvider.postExpedition(expedition, token);
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
 * This file defines the `ExpeditionController` class, which manages the process of creating and submitting 
 * expedition requests for packages within the application.
 *
 * Main functionalities include:
 *
 * 1. **User Information Management (readUserInformations)**:
 *    - The `readUserInformations` method retrieves the current user’s information from local storage using 
 *      `LocalFileServices`. This information is essential to identify the user making the expedition request 
 *      and include their unique identifier in the request.
 *
 * 2. **Expedition Details Setup (getExpeditionInfos)**:
 *    - The `getExpeditionInfos` method populates the `expeditionModel` object with all necessary details 
 *      required for the expedition, including:
 *      - **Price**: Specified by the user.
 *      - **Recipient’s Contact Email**: Provided by the user.
 *      - **User ID**: Retrieved from `userInfo`.
 *      - **Packet Specifications**: Weight, dimensions, and description of the package, stored in a `Packet` 
 *        model within `expeditionModel`.
 *
 * 3. **Demanding Expedition (demandExportPacket)**:
 *    - The `demandExportPacket` method sends the finalized expedition request to the backend using 
 *      `expeditionProvider`. It takes `ExpeditionModel` and the user’s token as parameters, initiating the 
 *      submission process.
 *
 * 4. **Search for Available Trajectories (searchTrajet)**:
 *    - The `searchTrajet` method queries the backend for available routes based on the provided departure 
 *      (`lieuDepart`) and arrival (`lieuArrive`) locations. The results, represented as a list of 
 *      `ResponsePublicationTrajetModel`, are stored in `trajectList`.
 *
 * Key variables and methods:
 * - `userInfo`: Stores current user information retrieved from local storage.
 * - `expeditionModel`: Model object storing expedition details, including the sender's user ID, package 
 *   description, weight, dimensions, and price.
 * - `expeditionProvider`: Service used to submit expedition requests.
 * - `publicationTrajetProvider`: Service used to search for available trajectories for package delivery.
 * - `selectedDate`: Holds the selected date for expedition.
 * - `packeDescription`, `packeHeight`, `packeWeight`, `packeLength`, `packeWidth`, `packePrice`, 
 *   `emailDestinataire`: Reactive variables used to hold package details, price, and recipient contact information.
 * - `lieuDepart`, `lieuArrive`: Reactive variables used for specifying the departure and arrival locations 
 *   for the search.
 * - `trajectList`: Holds the list of available routes matching the search criteria.
 *
 * This controller facilitates the user experience of preparing and submitting package expedition requests, 
 * from specifying package details to searching for suitable routes and confirming the request with the backend.
 */
