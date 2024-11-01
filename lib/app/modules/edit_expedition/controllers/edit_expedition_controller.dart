import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/expedition_model.dart';
import 'package:tripee/app/data/services/local_file_services.dart';
import 'package:tripee/app/modules/expedition/controllers/expedition_controller.dart';

class EditExpeditionController extends GetxController {
  ExpeditionController expeditionController = Get.find<ExpeditionController>();
  final reaOnly = true;
  Map<String, dynamic>? userInfo;
  final totalAmount = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
     calculTotalAmount();
  }

  getRideInformation(int rideId) {
    expeditionController.expeditionModel.rideId = rideId;
  }

  demandExportation(ExpeditionModel expeditionModel, String token) {
    expeditionController.demandExportPacket(expeditionModel, token);
  }

  calculTotalAmount() {
    totalAmount.value = int.parse(expeditionController.packeWeight.value) *
        int.parse(expeditionController.packeWeight.value);
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
