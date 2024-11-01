import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/modules/home/controllers/home_controller.dart';

class HeadSection extends StatelessWidget {
  HeadSection({super.key});

  final controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: Apptheme.ligthTheme.textTheme.bodyMedium,
            ),
            Obx(
              () => Text(
                "Bienvenue ${controller.userName.value}",
                style: Apptheme.ligthTheme.textTheme.headlineMedium!
                    .copyWith(color: AppColors.tertiaryColor),
              ),
            )
          ],
        ),
        const CardHeader(
          icon: Icons.menu_rounded,
        ),
      ],
    );
  }
}
