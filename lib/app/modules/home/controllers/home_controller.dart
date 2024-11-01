import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class HomeController extends GetxController {
  final lieuDepart = ''.obs;
  final lieuArrive = ''.obs;
  final userName = ''.obs;
  Map<String, dynamic>? userInfo;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    userName.value = userInfo!["username"];
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
