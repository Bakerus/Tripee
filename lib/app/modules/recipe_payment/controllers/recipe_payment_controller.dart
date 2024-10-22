import 'package:get/get.dart';
import 'package:tripee/app/data/models/category_payment_model.dart';

class RecipePaymentController extends GetxController {
  var selectedTabIndex = 0.obs; // Pour suivre l'index de l'onglet sélectionné
  var selectedSortMethod = "Plus recent".obs;
  List<String> sortMethod = ["Plus recent", "Plus ancien"];
  final _categories = {
    CategoryPaymentModel(
      "Tout",
    ): false,
    CategoryPaymentModel(
      "Paypal",
    ): false,
    CategoryPaymentModel(
      "E-wallet",
    ): false,
    CategoryPaymentModel(
      "Carte débit",
    ): false,
    CategoryPaymentModel(
      "Carte de credit",
    ): false,
    CategoryPaymentModel(
      "Transaction bancaire",
    ): false,
  }.obs;

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

  void updateSelectedSortMethod(String value) {
    selectedSortMethod.value = value;
  }

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  void toggle(CategoryPaymentModel item) {
    _categories[item] = !(_categories[item] ?? true);
  }

  get selectedCategories =>
      _categories.entries.where((e) => e.value).map((e) => e.key).toList();

  get categories => _categories.entries.map((e) => e.key).toList();
}
