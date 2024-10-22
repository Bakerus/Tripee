import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/textfield_home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  final double horizontalMarging;
  final String? initialValueDepart;
  final String? initialValueArrive;
  const Search(
      {super.key,
      this.horizontalMarging = 5.5,
      this.initialValueDepart,
      this.initialValueArrive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.0.hp,
      padding: EdgeInsets.only(
          bottom: 1.3.wp, top: 2.0.wp, right: 2.0.wp, left: 3.5.wp),
      margin: EdgeInsets.symmetric(horizontal: horizontalMarging.wp),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icones/bar.svg',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 80.0.wp,
                child: TextfieldHome(
                  initialValue: initialValueDepart,
                  hintText: "Lieu de depart",
                  color: AppColors.grayColor.withOpacity(0.7),
                  onChanged: (String) {},
                ),
              ),
              SizedBox(
                width: 80.0.wp,
                child: TextfieldHome(
                  initialValue: initialValueArrive,
                  hintText: "Trouvez votre destination",
                  color: AppColors.primaryColor.withOpacity(0.05),
                  onChanged: (String) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
