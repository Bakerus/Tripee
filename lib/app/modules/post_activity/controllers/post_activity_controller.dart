import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/services/local_file_services.dart';
import 'package:tripee/app/modules/post_expedition/controllers/post_expedition_controller.dart';
import 'package:tripee/app/modules/post_order/controllers/post_order_controller.dart';
import 'package:tripee/app/modules/post_publication/controllers/post_publication_controller.dart';

class PostActivityController extends GetxController {
  var selectedTabIndex = 0.obs; // Pour suivre l'index de l'onglet sélectionné
  Map<String, dynamic>? userInfo;
  final postOrderController = Get.put(PostOrderController());
  final postExportController = Get.put(PostExpeditionController());
  final postPublicationController = Get.put(PostPublicationController());

  @override
  Future<void> onInit() async {
    userInfo = await readUserInformations();

    super.onInit();
  }

  @override
  void onReady() {
    refreshCurrentTabData(0);
    super.onReady();
  }

  void changeTabIndex(int index) {
    selectedTabIndex.value = index; // Mettre à jour l'index
  }

  Future<void> refreshCurrentTabData(int index) async {
    switch (index) {
      case 0:
        await postPublicationController.fethAllTrajetUser(
            userInfo!["userId"], userInfo!["token"]);
        break;
      case 1:
        await postOrderController.fecthAllReservationtByUser(
            userInfo!["userId"], userInfo!["token"]);
        break;
      case 2:
        await postExportController.fecthAllExpeditionByUser(
            userInfo!["userId"], userInfo!["token"]);
        break;
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
