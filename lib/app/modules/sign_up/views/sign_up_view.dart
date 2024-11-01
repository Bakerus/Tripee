import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/textfield_login_and_signup.dart';
import 'package:tripee/app/modules/otp_verification/bindings/otp_verification_binding.dart';
import 'package:tripee/app/modules/otp_verification/views/otp_verification_view.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 22.0.hp, left: 7.0.wp, right: 7.0.wp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60.0.hp,
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
                              'Tripee',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Questrial',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      Text(
                        "Inscription",
                        style: Apptheme.ligthTheme.textTheme.displayLarge,
                      ),
                      SizedBox(
                        height: 42.0.hp,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextfieldLoginAndSignup(
                              hintText: "Nom d'utilisateur",
                              onChanged: (value) {
                                controller.userName.value = value;
                              },
                            ),
                            Obx(
                              () => TextfieldLoginAndSignup(
                                hintText: 'Email',
                                onChanged: (value) {
                                  // print(value);
                                  controller.email.value = value;
                                  controller.validateEmails();
                                },
                                errorText: controller.emailError.value,
                              ),
                            ),
                            Obx(
                              () => TextfieldLoginAndSignup(
                                hintText: 'Mot de passe',
                                onChanged: (value) {
                                  controller.password.value = value;
                                  controller.validatePassword();
                                },
                                errorText: controller.passwordError.value,
                              ),
                            ),
                            Obx(
                              () => TextfieldLoginAndSignup(
                                hintText: 'Telephone',
                                onChanged: (value) {
                                  controller.phoneNumber.value = value;
                                  controller.validatephoneNumber();
                                },
                                errorText: controller.phoneNumberError.value,
                              ),
                            ),
                            SizedBox(
                                width: 100.0.wp,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (controller.isvalidated.value ==
                                          true) {
                                        // calling the fuction to Retrieving user information
                                        controller.getUserInformations();
                                        //calling the fuction to Send Otp at the user
                                        controller.sendOtp(
                                            controller.phoneNumber.value);
                                        NavigationHelper
                                            .navigateWithFadeInWithBack(
                                                context,
                                                OtpVerificationBinding(),
                                                OtpVerificationView());
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                AppColors.darkColor)),
                                    child: const Text("S'inscrire"))),
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
