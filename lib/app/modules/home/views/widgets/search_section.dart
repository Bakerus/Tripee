import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/textfield_home.dart';
import 'package:tripee/app/modules/home/controllers/home_controller.dart';
import 'package:tripee/app/modules/order/bindings/order_binding.dart';
import 'package:tripee/app/modules/order/views/order_view.dart';

class SearchSection extends StatelessWidget {
  SearchSection({super.key});

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1.2.hp),
        margin: EdgeInsets.symmetric(horizontal: 5.5.wp, vertical: 2.0.hp),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        height: 34.0.hp,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lieu de départ",
                      style: Apptheme.ligthTheme.textTheme.titleMedium,
                    ),
                    TextfieldHome(
                        hintText: "Lieu de depart",
                        onChanged: (value) {
                          controller.lieuDepart.value = value;
                          // print("depart: ${controller.lieuDepart.value}");
                        },
                        color: AppColors.grayColor.withOpacity(0.7)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Destination",
                      style: Apptheme.ligthTheme.textTheme.titleMedium,
                    ),
                    TextfieldHome(
                      hintText: "Trouvez votre destination",
                      onChanged: (value) {
                        controller.lieuArrive.value = value;
                        // print("destination: ${controller.lieuArrive.value}");
                      },
                      color: AppColors.primaryColor.withOpacity(0.05),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100.0.wp,
                child: ElevatedButton(
                    onPressed: () {
                      // controller.fetchPlacesInfo(
                      //     place: controller.lieuDepart.value, state: true);
                      // controller.fetchPlacesInfo(
                      //     place: controller.lieuArrive.value, state: false);
                      NavigationHelper.navigateWithFadeInWithBack(
                          context,
                          OrderBinding(),
                          OrderView(
                            initialValueDepart: controller.lieuDepart.value,
                            initialValueArrive: controller.lieuArrive.value,
                          ));
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.sceondaryColor),
                    ),
                    child: const Text("Trouver un triper")),
              )
            ]));
  }
}
