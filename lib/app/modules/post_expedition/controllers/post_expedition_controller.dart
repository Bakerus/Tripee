import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/expedition_response_model.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/data/providers/expedition_provider.dart';
import 'package:tripee/app/data/providers/publication_trajet_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class PostExpeditionController extends GetxController {
  final searching = false.obs;
  final destination = "".obs;

  Future<List<ExpeditionResponseModel>>? trajectList;
  Map<String, dynamic>? userInfo;
  ExpeditionProvider expeditionProvider = ExpeditionProvider();
  PublicationTrajetProvider publicationTrajetProvider =
      PublicationTrajetProvider();
  ResponsePublicationTrajetModel? infoDriverPublication;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    await fecthAllExpeditionByUser(userInfo!["userId"], userInfo!["token"]);
  }

  Future<List<ExpeditionResponseModel>>? fecthAllExpeditionByUser(
      String userId, String token) {
    trajectList = expeditionProvider.getAllExpeditionByUser(userId, token);
    searching.value = true;
    return trajectList;
  }

  deleteExpeditionById(int rideId, String token) async {
    await expeditionProvider.deleteExpedition(rideId, token);
    searching.value = false;
    await fecthAllExpeditionByUser(userInfo!["userId"], userInfo!["token"]);
    searching.value = true;
  }

  fetchDriverInfos(String rideId, String token) async {
    infoDriverPublication = await publicationTrajetProvider
        .getUserInformationsbytrajet(rideId, token);
    destination.value = infoDriverPublication!.arrivalPlace.name;
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
