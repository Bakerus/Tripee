import 'dart:convert';

import 'package:get/get.dart';

import 'package:tripee/app/data/providers/reservation_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class CheckOrderController extends GetxController {
  Map<String, dynamic>? userInfo;
  final reservedplaces = 0.obs;
  final price = 0.0.obs;
  final totalAmount = 0.0.obs;
  final rideId = 0.obs;
  final checkStatut = false.obs;
  ReservationPrider reservationPrider = ReservationPrider();

  @override
  Future<void> onInit() async {
    super.onInit();
    calculateTotalAmount();
    userInfo = await readUserInformations();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  checkDemandReservation(String rideId, String token) {
    return reservationPrider.getAllReservationtByRide(rideId, token);
  }

  calculateTotalAmount() {
    totalAmount.value = reservedplaces.value * price.value;
  }

  acceptReservation(int reservId, int rideId, int numberOfPlaces, String token,
      {actions = "accept"}) {
    reservationPrider.updateReservationStatut(
        actions, reservId, rideId, numberOfPlaces, token);
  }

  refuseReservation(int reservId, int rideId, int numberOfPlaces, String token,
      {actions = "refuse"}) {
    reservationPrider.updateReservationStatut(
        actions, reservId, rideId, numberOfPlaces, token);
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
