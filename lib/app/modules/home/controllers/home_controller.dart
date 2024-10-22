import 'package:get/get.dart';
import 'package:tripee/app/data/providers/voyage_provider.dart';

class HomeController extends GetxController {
  final lieuDepart = ''.obs;
  final lieuArrive = ''.obs;
  VoyageProvider voyageProvider = VoyageProvider();
  // List<PlaceModel?> test1 = [];
  // List<PlaceModel?> test2 = [];

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  // fetchPlacesInfo({required String place, required bool state}) async {
  //   if (state == true) {
  //     test1 =
  //         await voyageProvider.getInformationsPlace(place: place, state: state);
  //     print(test1.first!.cityName);
  //   } else {
  //     test2 =
  //         await voyageProvider.getInformationsPlace(place: place, state: state);
  //     print(test2.first!.cityName);
  //   }
  // }
}
