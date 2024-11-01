import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/dialog_error.dart';
import 'package:tripee/app/core/widgets/dialog_loading.dart';
import 'package:tripee/app/core/widgets/textfield_login_and_signup.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:tripee/app/modules/sign_up/views/sign_up_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                            'Tripee',
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Questrial',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                    Text(
                      "Connexion",
                      style: Apptheme.ligthTheme.textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: 25.0.hp,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => TextfieldLoginAndSignup(
                                hintText: 'Email',
                                onChanged: (value) {
                                  controller.email.value = value;
                                  controller.validateEmails();
                                },
                                errorText: controller.emailError.value,
                              )),
                          Obx(() => TextfieldLoginAndSignup(
                                hintText: 'Mot de passe',
                                onChanged: (value) {
                                  controller.password.value = value;
                                  controller.validatePassword();
                                },
                                errorText: controller.passwordError.value,
                              )),
                          SizedBox(
                            width: 100.0.wp,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.isvalidated.value == true) {
                                  //calling the fuction to Retrieving user information
                                  controller.getUserInformations();
                                  //calling the fuction to Executing the connection function
                                  await controller.loginUser(controller.user);
                                  // Manage registration status(Depending on the values supplied by the controller, the ui will present specific elements)
                                  if (controller.isregister.value == false) {
                                    showDialog(
                                      context:
                                          context.mounted ? context : context,
                                      builder: (BuildContext context) {
                                        return DialogError(
                                          title: "Error",
                                          describe: controller
                                              .errorMessageForLogin.value,
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context:
                                          context.mounted ? context : context,
                                      builder: (BuildContext context) {
                                        return const DialogLoading();
                                      },
                                    );
                                    if (controller.isloading.value == true) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        NavigationHelper
                                            .navigateWithFadeWithoutBack(
                                          context,
                                          DashboardBinding(),
                                          DashboardView(),
                                        );
                                      });
                                    }
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    AppColors.darkColor),
                              ),
                              child: const Text('Se connecter'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas de compte?',
                    style: Apptheme.ligthTheme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.navigateWithFadeInWithBack(
                          context, SignUpBinding(), const SignUpView());
                    },
                    child: Text(' Inscription',
                        style: Apptheme.ligthTheme.textTheme.titleMedium!
                            .copyWith(color: AppColors.primaryColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
