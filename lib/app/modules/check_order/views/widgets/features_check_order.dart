import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/modules/check_order/controllers/check_order_controller.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

class FeaturesCheckOrder extends StatelessWidget {
  final Future<List<ReservationResponseModel>>? reservationList;
  final String userName;
  final double horizontalPadding;
  final double width;
  FeaturesCheckOrder(
      {super.key,
      this.horizontalPadding = 2.5,
      this.width = 100.0,
      required this.userName,
      required this.reservationList});
  final controller = Get.put(CheckOrderController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.0.hp,
      child: FutureBuilder(
          future: reservationList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 6,
                color: AppColors.primaryColor,
              ));
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Aucun trajet trouvé",
                            style: Apptheme.ligthTheme.textTheme.headlineMedium!
                                .copyWith(
                              color: AppColors.redColor,
                            )),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              final reservations = snapshot.data;
              return SizedBox(
                width: 90.0.wp,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: reservations!.length,
                  onPageChanged: (index) {
                    controller.price.value = reservations[index].price;
                    controller.reservedplaces.value =
                        reservations[index].reservedPlaces;
                    controller.rideId.value = reservations[index].rideId;
                    controller.calculateTotalAmount();
                    controller.checkStatut.value = false;
                  },
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.0.wp,
                          child: CardTriper(
                              id: reservation.user.id.toString(),
                              name: userName,
                              phoneNumber: reservation.user.phoneNumber,
                              leftMargin: 0.0,
                              rightMargin: 0.0,
                              bottom: 1.0),
                        ),
                        Search(
                          horizontalMarging: 0.0,
                          initialValueArrive: reservation.arrivalPLace,
                          initialValueDepart: reservation.departurePlace,
                          readOnly: true,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding.wp),
                          width: width.wp,
                          child: Column(
                            children: [
                              CardFormulaire(
                                  title: "Date de départ",
                                  widget_1: SizedBox(
                                    width: 24.0.wp,
                                    child: Center(
                                      child: Text(
                                        reservation.reservationDate,
                                        style: Apptheme
                                            .ligthTheme.textTheme.titleSmall!
                                            .copyWith(
                                                color: AppColors
                                                    .textPlaceholderColor),
                                      ),
                                    ),
                                  ),
                                  widget_2: const SizedBox()),
                              CardFormulaire(
                                  title: "Heure de depart",
                                  widget_1: SizedBox(
                                    width: 24.0.wp,
                                    child: Center(
                                      child: Text(
                                        reservation.reservationTime,
                                        style: Apptheme
                                            .ligthTheme.textTheme.titleSmall!
                                            .copyWith(
                                                color: AppColors
                                                    .textPlaceholderColor),
                                      ),
                                    ),
                                  ),
                                  widget_2: const SizedBox()),
                              CardFormulaire(
                                  title: "Places démandées",
                                  widget_1: SizedBox(
                                    width: 24.0.wp,
                                    child: Center(
                                      child: Text(
                                        reservation.reservedPlaces.toString(),
                                        style: Apptheme
                                            .ligthTheme.textTheme.titleSmall!
                                            .copyWith(
                                                color: AppColors
                                                    .textPlaceholderColor),
                                      ),
                                    ),
                                  ),
                                  widget_2: const SizedBox()),
                              CardFormulaire(
                                  title: "Bagages",
                                  widget_1: SizedBox(
                                    width: 24.0.wp,
                                    child: Center(
                                      child: Text(
                                        (reservation.hasLuggage == true)
                                            ? "Oui"
                                            : "Non",
                                        style: Apptheme
                                            .ligthTheme.textTheme.titleSmall!
                                            .copyWith(
                                                color: AppColors
                                                    .textPlaceholderColor),
                                      ),
                                    ),
                                  ),
                                  widget_2: const SizedBox()),
                              CardFormulaire(
                                title: "Prix",
                                widget_1: Text(
                                  reservation.price.toString(),
                                  style: Apptheme
                                      .ligthTheme.textTheme.titleSmall!
                                      .copyWith(
                                          color:
                                              AppColors.textPlaceholderColor),
                                ),
                                widget_2: const Text("\$CAD"),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Container(
                            width: 100.0.wp,
                            height: 22.0.hp,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              border: Border(
                                  top: BorderSide(
                                      width: 1.0,
                                      color: AppColors.borderColor)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Total'),
                                    Text("${controller.totalAmount.value}\$ ",
                                        style: Apptheme
                                            .ligthTheme.textTheme.headlineSmall!
                                            .copyWith(
                                                color: AppColors.textColor))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Places restantes'),
                                    Text("-- Places",
                                        style: Apptheme
                                            .ligthTheme.textTheme.headlineSmall!
                                            .copyWith(
                                                color: AppColors.textColor))
                                  ],
                                ),
                                ButtonsFormulaire(
                                  title: controller.checkStatut.value == false
                                      ? "Valider la demande"
                                      : "Annuler la demande",
                                  backgroundColor:
                                      controller.checkStatut.value == false
                                          ? Colors.green
                                          : AppColors.primaryColor,
                                  forgroundColor: AppColors.white,
                                  borderColor: Colors.transparent,
                                  onPressed: () {
                                    controller.checkStatut.value == false
                                        ? controller.acceptReservation(
                                            reservation.id,
                                            reservation.rideId,
                                            reservation.reservedPlaces,
                                            controller.userInfo!['token'])
                                        : controller.refuseReservation(
                                            reservation.id,
                                            reservation.rideId,
                                            reservation.reservedPlaces,
                                            controller.userInfo!['token']);
                                    controller.checkStatut.value =
                                        !controller.checkStatut.value;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
