import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:pinput/pinput.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/loader_page.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 28.0.hp, left: 7.0.wp, right: 7.0.wp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0.hp),
              height: 45.0.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 42.0.wp,
                      height: 6.0.hp,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          'Trippe',
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Questrial',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Text(
                    "Entrez le pass code",
                    style: Apptheme.ligthTheme.textTheme.displayLarge,
                  ),
                  Text(
                    "Saisissez le code Tripee envoyé sur votre telephone",
                    style: Apptheme.ligthTheme.textTheme.titleLarge!
                        .copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 25.0.hp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Pinput(
                          onCompleted: (value) {
                            controller.updateOtpState();
                          },
                          separatorBuilder: (index) => Container(
                            width: 1.0.wp,
                            height: 0.2.hp,
                            decoration: const BoxDecoration(
                                color: AppColors.textSecondaryColor),
                          ),
                          defaultPinTheme: PinTheme(
                              margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
                              width: 22.0.wp,
                              height: 9.0.hp,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: AppColors.grayColor,
                                  border: Border(
                                      right: BorderSide(
                                          color: AppColors.borderColor),
                                      left: BorderSide(
                                          color: AppColors.borderColor),
                                      bottom: BorderSide(
                                          color: AppColors.borderColor),
                                      top: BorderSide(
                                          color: AppColors.borderColor)))),
                        ),
                        Obx(
                          () => SizedBox(
                              width: 100.0.wp,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.otpState.value == true) {
                                      NavigationHelper
                                          .navigateToSuccesOrFailedPage(
                                              context,
                                              LoaderPage(
                                                  actions:
                                                      "Vous êtes connecté !",
                                                  transition: () {
                                                    NavigationHelper
                                                        .navigateWithFadeInWithoutBack(
                                                            context,
                                                            DashboardBinding(),
                                                            DashboardView());
                                                  }));
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          controller.otpState.value == false
                                              ? WidgetStateProperty.all<Color>(
                                                  AppColors.grayColor)
                                              : WidgetStateProperty.all<Color>(
                                                  AppColors.darkColor)),
                                  child: const Text(
                                    'Envoyer',
                                    style: TextStyle(
                                        color: AppColors.textPlaceholderColor),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
