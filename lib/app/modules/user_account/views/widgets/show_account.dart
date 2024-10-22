import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/modules/user_account/controllers/user_account_controller.dart';
import 'package:tripee/app/modules/user_account/views/widgets/textField_account.dart';

class ShowAccount extends StatelessWidget {
  ShowAccount({super.key});
  final controller = Get.put(UserAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        foregroundColor: AppColors.white,
        title: Container(
          padding: EdgeInsets.only(right: 45.0.wp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => controller.previousStep(),
                child: const CardHeader(
                  icon: Icons.arrow_back,
                ),
              ),
              Text(
                "Votre Compte",
                style: Apptheme.ligthTheme.textTheme.headlineMedium!
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 5.5.wp, right: 23.0.wp, bottom: 7.0.hp),
                decoration: const BoxDecoration(
                    color: AppColors.textColor,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/banner.png',
                        ),
                        fit: BoxFit.cover)),
                width: 100.0.wp,
                height: 18.0.hp,
              ),
            ],
          ),
          Positioned(
            bottom: 11.0.hp,
            child: SizedBox(
              height: 60.0.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0.sp,
                        backgroundColor: AppColors.textPlaceholderColor,
                      ),
                      const IconButton(
                          onPressed: null, icon: Icon(Icons.camera_alt))
                    ],
                  ),
                  TextfieldAccount(
                    title: "Nom",
                    color: AppColors.primaryColor.withOpacity(0.07),
                    hintText: "Dr Mederos",
                    initialValue: "Dr Mederos",
                    onChanged: (p0) {},
                  ),
                  TextfieldAccount(
                    title: "Numero de telephone",
                    color: AppColors.white,
                    hintText: "+12 **** 7890",
                    initialValue: "+12 **** 7890",
                    onChanged: (p0) {},
                  ),
                  TextfieldAccount(
                    title: "Email",
                    color: AppColors.white,
                    hintText: "mederos@gmail.com",
                    initialValue: "mederos@gmail.com",
                    onChanged: (p0) {},
                  ),
                  SizedBox(
                    width: 92.0.wp,
                    child: const ButtonsFormulaire(
                        title: "Enregistrer",
                        borderColor: Colors.transparent,
                        backgroundColor: AppColors.textColor,
                        forgroundColor: AppColors.white),
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
