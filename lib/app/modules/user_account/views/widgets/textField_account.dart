import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class TextfieldAccount extends StatelessWidget {
  final String title;
  final Color color;
  final String hintText;
  final String? initialValue;
  final Function(String) onChanged;
  const TextfieldAccount(
      {super.key,
      required this.color,
      required this.title,
      required this.hintText,
      this.initialValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.wp,
      height: 10.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Apptheme.ligthTheme.textTheme.titleSmall,
          ),
          SizedBox(
            height: 6.0.hp,
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
                                color: AppColors.backgroundColor,
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
          ),
        ],
      ),
    );
  }
}
