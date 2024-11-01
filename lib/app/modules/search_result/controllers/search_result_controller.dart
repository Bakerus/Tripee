import 'package:get/get.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/modules/expedition/controllers/expedition_controller.dart';

class SearchResultController extends GetxController {
  Future<List<ResponsePublicationTrajetModel>>? trajectList;
  final ExpeditionController expeditionController =
      Get.find<ExpeditionController>();

  final lieuArrive = "".obs;
  final lieuDepart = "".obs;
  final imagePath = "".obs;
  final reaOnly = true;

  @override
  void onInit() {
    super.onInit();
    trajectList = expeditionController.trajectList;
    lieuArrive.value = expeditionController.lieuArrive.value;
    lieuDepart.value = expeditionController.lieuDepart.value;
  }

}
/**
 * This file defines the `SearchResultController` class, which is responsible for managing the search results 
 * and displaying trajectories or routes that match the user’s criteria in the application.
 *
 * Key functionalities include:
 *
 * 1. **Initializing Search Results (onInit)**:
 *    - The `onInit` method is used to initialize the search results by accessing the properties of 
 *      `ExpeditionController`, which contains the original search parameters and result list. This includes:
 *      - Setting the `trajectList` with the list of available routes from `ExpeditionController`.
 *      - Copying the `lieuDepart` and `lieuArrive` values from `ExpeditionController` to ensure that 
 *        the user’s initial search parameters are accurately reflected in this controller.
 *
 * 2. **Managing Search Parameters**:
 *    - The `lieuDepart` and `lieuArrive` reactive variables store the departure and arrival locations 
 *      for the user’s search.
 *    - `imagePath`: This is an observable variable intended to store the image path related to search results, 
 *      if applicable.
 *    - `reaOnly`: This is a boolean constant that is set to `true` to indicate that the search results 
 *      are in a read-only mode and cannot be edited.
 *
 * Key variables and properties:
 * - `expeditionController`: A reference to `ExpeditionController`, which is used to retrieve the search 
 *   parameters and results directly from the expedition module.
 * - `trajectList`: Holds the list of available trajectories/routes that match the search criteria.
 * - `lieuDepart` and `lieuArrive`: Reactive variables representing the departure and arrival locations 
 *   used for the search.
 * - `imagePath`: An observable variable that can hold a string representing the path of an image related to 
 *   the search results, if needed.
 * - `reaOnly`: A constant flag set to true to indicate that the search results are read-only.
 *
 * By accessing and reflecting the search criteria from `ExpeditionController`, this controller simplifies 
 * the presentation of search results while ensuring consistency across modules. This setup enables the 
 * `SearchResultController` to directly display and manage the results without duplicating logic or data.
 */
