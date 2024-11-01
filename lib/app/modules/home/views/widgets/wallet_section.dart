import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 23.0.hp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.borderColor),
            image: const DecorationImage(
              image: AssetImage("assets/images/wallet.png"),
              fit: BoxFit.cover,
            )),
        child: Row(children: [
          Container(
            padding: EdgeInsets.all(1.3.hp),
            width: 50.0.wp,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 11.0.sp,
                        backgroundColor: AppColors.darkColor,
                        child: SvgPicture.asset(
                          'assets/icones/wallet_icon.svg',
                        ),
                      ),
                      Text(
                        "Total des depense",
                        style: Apptheme.ligthTheme.textTheme.titleMedium!
                            .copyWith(color: AppColors.backgroundColor),
                      ),
                      Icon(Icons.arrow_drop_down,
                          size: 15.0.sp, color: AppColors.white),
                    ],
                  ),
                  Text(
                    "\$${0}",
                    style: Apptheme.ligthTheme.textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.sceondaryColor),
                      ),
                      onPressed: null,
                      child: const Text("Voir l'historique")),
                ]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(1.3.hp),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.9.wp, vertical: 1.0.hp),
                        decoration: BoxDecoration(
                          color: AppColors.grayColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "Wallet Tripee",
                          style: Apptheme.ligthTheme.textTheme.titleSmall!
                              .copyWith(color: AppColors.darkColor),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Note",
                          style: Apptheme.ligthTheme.textTheme.titleSmall!
                              .copyWith(color: AppColors.textSecondaryColor)),
                      SizedBox(
                        width: 14.0.wp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 10.0.sp,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(Icons.star, size: 11.5.sp),
                            ),
                            const Row(
                              children: [
                                Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.darkColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("/5")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
