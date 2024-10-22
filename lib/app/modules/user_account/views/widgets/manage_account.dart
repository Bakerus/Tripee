import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/user_account/controllers/user_account_controller.dart';
import 'package:tripee/app/modules/user_account/views/widgets/options.dart';

class ManageAccount extends StatelessWidget {
  ManageAccount({super.key});
  final controller = Get.find<UserAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        foregroundColor: AppColors.white,
        title: const Text('Votre Compte'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 5.5.wp, right: 23.0.wp, bottom: 7.0.hp),
                decoration: const BoxDecoration(color: AppColors.textColor),
                width: 100.0.wp,
                height: 18.0.hp,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30.0.sp,
                      ),
                      SizedBox(
                        height: 10.0.hp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Dr Mederos",
                                style: Apptheme
                                    .ligthTheme.textTheme.headlineSmall!
                                    .copyWith(color: AppColors.white)),
                            Text("+12 **** 7890",
                                style: Apptheme.ligthTheme.textTheme.bodyMedium!
                                    .copyWith(color: AppColors.white)),
                            GestureDetector(
                              onTap: () => controller.nextStep(),
                              child: Container(
                                width: 44.0.wp,
                                height: 4.0.hp,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 1.0.wp),
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      size: 12.0.sp,
                                      color: AppColors.white,
                                    ),
                                    Text("Paramètres du compte",
                                        style: Apptheme
                                            .ligthTheme.textTheme.titleSmall!
                                            .copyWith(color: AppColors.white)),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12.0.sp,
                                      color: AppColors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          Positioned(
            top: 13.0.hp,
            child: SizedBox(
              height: 52.0.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 16.0.hp,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.textPlaceholderColor),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                          height: 7.5.hp,
                          width: 100.0.wp,
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: AppColors.textPlaceholderColor))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 23.0.wp,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 15.0.sp,
                                        backgroundColor:
                                            AppColors.textPlaceholderColor,
                                      ),
                                      Text("Reçus",
                                          style: Apptheme
                                              .ligthTheme.textTheme.titleLarge!
                                              .copyWith(
                                                  color: AppColors.darkColor)),
                                    ],
                                  ),
                                ),
                                const Text(
                                  "200",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.darkColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                          height: 7.5.hp,
                          width: 100.0.wp,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30.0.wp,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 15.0.sp,
                                        backgroundColor:
                                            AppColors.textPlaceholderColor,
                                      ),
                                      Text("Dépenses",
                                          style: Apptheme
                                              .ligthTheme.textTheme.titleLarge!
                                              .copyWith(
                                                  color: AppColors.darkColor)),
                                    ],
                                  ),
                                ),
                                const Text(
                                  "-200",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.redColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const Options(
                    title: "Sécurité",
                  ),
                  const Options(
                    title: "Centre d'aide",
                  ),
                  const Options(
                    title: "Licences et conditions d'utilisation",
                  ),
                  const Options(
                    title: "Politique de confidentialité",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
