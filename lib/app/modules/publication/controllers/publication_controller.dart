import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripee/app/data/models/place_model.dart';
import 'package:tripee/app/data/models/publication_trajet_model.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/providers/voyage_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class PublicationController extends GetxController {
  var currentStep = 1.obs;
  final imagePath = "".obs;
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  final bagages = ['Oui', 'Non'];
  final colis = ['Oui', 'Non'];
  final price = "".obs;
  final weight = "".obs;
  final isloanding = false.obs;
  Map<String, dynamic>? userInfo;
  final selectednombrePlaces = "1".obs;
  final selectedBagages = "Oui".obs;
  final selectedColis = "Oui".obs;
  final lieuDepart = ''.obs;
  final lieuArrive = ''.obs;
  final vehicleBrand = ''.obs;
  final vehicleRegisterNumber = ''.obs;
  List<PlaceModel?> departureInformations = [];
  List<PlaceModel?> arrivalsInformations = [];
  VoyageProvider voyageProvider = VoyageProvider();
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  final nombrePlaces = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
  }

  void updateSelectedItem(String? value, RxString? selectedItem) {
    selectedItem!.value = value!;
  }

  void nextStep() {
    if (currentStep < 2) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep > 1) {
      currentStep.value--;
    }
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  getPublicationInformations() async {
    PublicationTrajetModel publicationTrajetModel = PublicationTrajetModel(
        departureDate:
            "${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}",
        departureTime:
            "${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute}",
        departurePlace: PlaceModel(
            cityName: departureInformations.first!.cityName
                .replaceAll(" ", "")
                .toLowerCase(),
            latitude: departureInformations.first!.latitude,
            longitude: departureInformations.first!.longitude,
            detail: departureInformations.first!.detail,
            town: departureInformations.first!.town),
        arrivalPlace: PlaceModel(
            cityName: arrivalsInformations.first!.cityName
                .replaceAll(" ", "")
                .toLowerCase(),
            latitude: arrivalsInformations.first!.latitude,
            longitude: arrivalsInformations.first!.longitude,
            detail: arrivalsInformations.first!.latitude,
            town: arrivalsInformations.first!.town),
        vehicle: VehicleModel(
            vehicleBrand: vehicleBrand.value,
            registrationNumber: vehicleRegisterNumber.value),
        price: double.parse(price.value),
        availablePlaces: int.parse(selectednombrePlaces.value),
        maxWeight: double.parse(weight.value),
        doExpedition: (selectedColis.value == "Oui") ? true : false,
        userId: int.parse(userInfo!['userId']));

    debugPrint(jsonEncode(publicationTrajetModel.toJson()));
    await publishTrajet(
      jsonEncode(publicationTrajetModel.toJson()),
      imagePath.value,
      userInfo!['token'],
    );
  }

  fetchPlacesInfo({required String place, required bool state}) async {
    if (state == true) {
      departureInformations =
          (await voyageProvider.getInformationsPlace(place: place));
    } else {
      arrivalsInformations = await voyageProvider.getInformationsPlace(
        place: place,
      );
    }
  }

  publishTrajet(
    String publicationTrajetModel,
    String imagePath,
    String token,
  ) async {
    await publicationTrajetProvider.postTrajet(
      publicationTrajetModel,
      imagePath,
      token,
    );
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
 * This file defines the `PublicationController` class, which manages the publication process for a trip or 
 * journey in the application. It includes various functionalities to gather user input, manage images, fetch 
 * location details, and publish a trip.
 *
 * Main functionalities include:
 *
 * 1. **Step Management (currentStep)**: Manages the multi-step form for publishing a trip, with `nextStep()` 
 *    and `previousStep()` methods to control form navigation.
 *
 * 2. **Image Handling (getImage())**: Allows the user to select an image from their gallery, storing the image 
 *    path in `imagePath`. The selected image can be used as part of the trip publication details.
 *
 * 3. **Fetching Place Information (fetchPlacesInfo())**: Uses `VoyageProvider` to retrieve geographical 
 *    information based on the departure and arrival locations entered by the user. Populates lists like 
 *    `departureInformations` and `arrivalsInformations` for these locations.
 *
 * 4. **User Information Management (readUserInformations())**: Reads locally stored user information from a file 
 *    to pre-fill trip details, making use of `LocalFileServices`.
 *
 * 5. **Data Compilation for Trip Publication (getPublicationInformations())**: Aggregates user-entered 
 *    information (departure and arrival data, vehicle details, trip parameters) to create a 
 *    `PublicationTrajetModel` instance, which is then serialized and debug-printed for verification.
 *
 * 6. **Trip Submission (publishTrajet())**: Submits the compiled trip details and any selected image to the 
 *    server through `PublicationTrajetProvider`, completing the trip publication process.
 *
 * Key variables and methods:
 * - `currentStep`, `imagePath`, `selectedDate`, `selectedTime`: Reactive variables that track the user's input 
 *   and the form step for publishing a trip.
 * - `departureInformations`, `arrivalsInformations`: Lists containing geographical data for departure and 
 *   arrival locations, as retrieved from the API.
 * - `userInfo`: Holds user-specific details, which are fetched at initialization for a more personalized experience.
 * - `getPublicationInformations`: Compiles all trip-related data into a model for submission.
 * - `publishTrajet`: Handles the final submission of trip details and image to the server.
 *
 * The class uses GetX's reactivity to manage state and update the UI seamlessly as user inputs change, 
 * making the trip publication process interactive and efficient.
 */