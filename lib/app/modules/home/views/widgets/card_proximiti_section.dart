import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardProximitiSection extends StatelessWidget {
  const CardProximitiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0.hp,
      margin: EdgeInsets.only(bottom: 20, left: 5.5.wp, right: 5.5.wp),
      padding: EdgeInsets.symmetric(horizontal: 1.5.wp),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.darkColor,
            child: SvgPicture.asset(
              'assets/icones/location_reservation.svg',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Home",
                style: Apptheme.ligthTheme.textTheme.titleMedium,
              ),
              SizedBox(
                width: 45.0.wp,
                child: Text(
                  "Unité 7, 123, rue Oak Vancouver, Colombie-Britannique, V6Z2Y7",
                  style: Apptheme.ligthTheme.textTheme.bodySmall,
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.0.hp,
            width: 23.0.wp,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.primaryColor),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 2.0.wp))),
                onPressed: () {},
                child: const Text("Réserver")),
          )
        ],
      ),
    );
  }
}
