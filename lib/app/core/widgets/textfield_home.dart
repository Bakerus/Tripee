import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextfieldHome extends StatelessWidget {
  final Color color;
  final String hintText;
  final String? initialValue;
  final Function(String) onChanged;
  const TextfieldHome(
      {super.key,
      required this.color,
      required this.hintText,
      this.initialValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp,
      height: 7.0.hp,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 3.0.wp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 8.0.wp,
                      height: 4.5.hp,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: Icon(
                          size: 16.0.sp,
                          Icons.search,
                          color: AppColors.darkColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 8.5.wp,
                  decoration: BoxDecoration(
                    color: AppColors.darkColor.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icones/poistionSearch.svg',
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: color,
          hintText: hintText,
          hintStyle: Apptheme.ligthTheme.textTheme.bodyMedium!
              .copyWith(color: AppColors.textSecondaryColor),
        ),
      ),
    );
  }
}
