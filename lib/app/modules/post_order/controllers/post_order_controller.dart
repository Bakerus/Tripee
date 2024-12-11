import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/providers/reservation_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class PostOrderController extends GetxController {
  Future<List<ReservationResponseModel>>? reservationList;
  ReservationPrider reservationPrider = ReservationPrider();
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  ResponsePublicationTrajetModel? infoDriverPublication;

  Map<String, dynamic>? userInfo;
  final searching = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    await fecthAllReservationtByUser(userInfo!["userId"], userInfo!["token"]);
  }

  fecthAllReservationtByUser(String userId, String token) {
    reservationList = reservationPrider.getAllReservationtByUser(userId, token);
    searching.value = true;
  }

  String parseStatut(statut) {
    if (statut == "ON_HOLD") {
      return "En attente";
    } else if (statut == "ACCEPTED") {
      return "Accepté";
    } else if (statut == "REFUSED") {
      return "Refusé";
    } else {
      return "";
    }
  }

  deletReservationId(int rideId, String token) async {
    await reservationPrider.deleteReservation(rideId, token);
    searching.value = false;
    await fecthAllReservationtByUser(userInfo!["userId"], userInfo!["token"]);
    searching.value = true;
  }

  fetchDriverInfos(String rideId, String token) async {
    infoDriverPublication = await publicationTrajetProvider
        .getUserInformationsbytrajet(rideId, token);
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
