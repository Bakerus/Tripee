import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/reservation_request_model.dart';
import 'package:tripee/app/data/providers/reservation_provider.dart';

import 'package:tripee/app/data/services/local_file_services.dart';

class ConfirmOrderController extends GetxController {
  Map<String, dynamic>? userInfo;
  ReservationRequestModel reservationRequestModel = ReservationRequestModel();
  ReservationPrider reservationPrider = ReservationPrider();
  final totalAmount = 0.0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
  }

  final nombrePlaces = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final bagages = ['Oui', 'Non'];

  var choosedValue = "";

  final selectednombrePlaces = "0".obs;
  final selectedBagages = "Oui".obs;

  void updateSelectedItemBagages(String value, RxString selectedItem) {
    selectedItem.value = value;
  }

  void updateSelectedItemPlace(
    String value,
    RxString selectedItem,
  ) {
    selectedItem.value = value;
  }

  calculateTotalAmount(double price) {
    totalAmount.value = (price * int.parse(selectednombrePlaces.value));
  }

  getReservationInfo(double price, int rideId) {
    reservationRequestModel = ReservationRequestModel(
      hasLuggage: (selectedBagages.value == "Oui") ? true : false,
      reservedPlaces: int.parse(selectednombrePlaces.value),
      userId: int.parse(userInfo!['userId']),
      price: double.parse(price.toString()),
      rideId: int.parse(rideId.toString()),
    );
  }

  demandReservation(ReservationRequestModel reservation, String token) {
    reservationPrider.postReservation(reservation, token);
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
 * This file defines the `ConfirmOrderController` class, which manages the reservation process for trips 
 * within the application. It handles the selection of trip details like the number of seats, luggage option, 
 * and calculates the total cost based on user inputs.
 *
 * Main functionalities include:
 *
 * 1. **User Information Management (readUserInformations)**:
 *    - The `readUserInformations` method retrieves the current user’s information stored locally, such as 
 *      their user ID and token, through `LocalFileServices`. This is essential for user-specific actions 
 *      like making reservations.
 *
 * 2. **Reservation Details Setup (getReservationInfo)**:
 *    - `getReservationInfo` method populates the `reservationRequestModel` with all required information 
 *      for a reservation, including whether the user has luggage, the number of reserved seats, user ID, 
 *      price, and ride ID.
 * 
 * 3. **Demanding Reservation (demandReservation)**:
 *    - The `demandReservation` method sends the reservation request to the backend through 
 *      `reservationPrider`. It takes `ReservationRequestModel` and user token as parameters, triggering 
 *      the reservation process.
 *
 * 4. **Selection Management**:
 *    - `nombrePlaces` and `bagages`: Options available for the number of seats and luggage choice, respectively.
 *    - `updateSelectedItemBagages` and `updateSelectedItemPlace`: Functions to update reactive variables 
 *      (`selectedBagages` and `selectednombrePlaces`) based on the user’s selections in the UI.
 *
 * 5. **Total Amount Calculation (calculateTotalAmount)**:
 *    - Calculates the total cost of the reservation based on the price per seat and the number of seats 
 *      selected by the user, storing the result in `totalAmount`.
 *
 * Key variables and methods:
 * - `userInfo`: Holds current user information retrieved from local storage.
 * - `reservationRequestModel`: Model object storing reservation details.
 * - `reservationPrider`: Service for sending reservation requests.
 * - `selectednombrePlaces`, `selectedBagages`: Reactive variables for seat and luggage selection, respectively.
 * - `totalAmount`: Holds the calculated reservation cost.
 *
 * This controller effectively coordinates the reservation process, from gathering user details and calculating 
 * costs to sending the reservation request, ensuring a smooth and responsive user experience for confirming orders.
 */
