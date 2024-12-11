import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/modules/confirm_order/bindings/confirm_order_binding.dart';
import 'package:tripee/app/modules/confirm_order/views/confirm_order_view.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/order/bindings/order_binding.dart';
import 'package:tripee/app/modules/publication/views/widgets/hearder_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import 'package:tripee/app/modules/searching/bindings/searching_binding.dart';
import 'package:tripee/app/modules/searching/views/searching_view.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  final RxString? initialValueDepart;
  final RxString? initialValueArrive;
  final bool fromHomePage;
  const OrderView(
      {super.key,
      this.initialValueDepart,
      this.initialValueArrive,
      this.fromHomePage = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 97.0.hp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                  width: 72.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            NavigationHelper.navigateWithFadeInWithBack(
                                context, DashboardBinding(), DashboardView()),
                        child: const CardHeader(
                          icon: Icons.arrow_back,
                        ),
                      ),
                      Text(
                        "Rechercher un triper",
                        style: Apptheme.ligthTheme.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                const HearderFirstSection(
                  actions: "Detaillez votre voyage",
                ),
                Search(
                  lieuDepart: (fromHomePage == false)
                      ? controller.lieuDepart
                      : initialValueDepart,
                  lieuArrive: (fromHomePage == false)
                      ? controller.lieuArrive
                      : initialValueDepart,
                  initialValueDepart: initialValueDepart?.value,
                  initialValueArrive: initialValueArrive?.value,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                  height: 7.0.hp,
                  color: AppColors.white,
                  child: ButtonsFormulaire(
                    title: "Lancer la recherche",
                    borderColor: AppColors.primaryColor,
                    backgroundColor: AppColors.primaryColor,
                    forgroundColor: AppColors.white,
                    onPressed: () async {
                      await controller.searchTrajet(
                          (fromHomePage == false)
                              ? controller.lieuDepart.value
                              : initialValueDepart!.value,
                          (fromHomePage == false)
                              ? controller.lieuArrive.value
                              : initialValueArrive!.value,
                          controller.userInfo!['token']);

                      NavigationHelper.navigateWithFadeWithtBack(
                          context.mounted ? context : context,
                          SearchingBinding(),
                          SearchingView(
                            transition: () =>
                                NavigationHelper.navigateWithFadeWithtBack(
                                    context,
                                    OrderBinding(),
                                    OrderView(
                                      initialValueDepart:
                                          (fromHomePage == false)
                                              ? controller.lieuDepart
                                              : initialValueDepart,
                                      initialValueArrive:
                                          (fromHomePage == false)
                                              ? controller.lieuArrive
                                              : initialValueArrive!,
                                    )),
                          ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.5.wp),
                  child: Text(
                    "Résultat des recherches",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                    height: 43.0.hp,
                    child: Obx(
                      () => (controller.searching.value == false)
                          ? const SizedBox.shrink()
                          : FutureBuilder(
                              future: controller.trajectList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 6,
                                    color: AppColors.primaryColor,
                                  ));
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              AppColors.backgroundColor,
                                          radius: 40.0.sp,
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.redColor,
                                            size: 40.0.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 13.0.hp,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Aucun trajet trouvé",
                                                  style: Apptheme.ligthTheme
                                                      .textTheme.headlineMedium!
                                                      .copyWith(
                                                    color: AppColors.redColor,
                                                  )),
                                              Text("",
                                                  textAlign: TextAlign.center,
                                                  style: Apptheme.ligthTheme
                                                      .textTheme.bodyMedium),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  final trajets = snapshot.data;
                                  return ListView.builder(
                                    itemCount: trajets!.length,
                                    itemBuilder: (context, index) {
                                      final trajet = trajets[index];
                                      return CardTriper(
                                        ontap: () {
                                          NavigationHelper
                                              .navigateWithFadeInWithBack(
                                                  context,
                                                  ConfirmOrderBinding(),
                                                  ConfirmOrderView(
                                                    responsePublicationTrajetModel:
                                                        trajet,
                                                  ));
                                        },
                                        phoneNumber: trajet.user.phoneNumber,
                                        id: trajet.user.id.toString(),
                                        name: trajet.user.userName,
                                        imagePath: trajet.vehicle.imagePath,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
