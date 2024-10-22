import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class DropDownCustomized extends StatelessWidget {
  final List<String> itemsList;
  final Function(String?) updateSelectedItem;
  final String seletedItem;
  final double width;
  const DropDownCustomized(
      {super.key,
      required this.itemsList,
      required this.seletedItem,
      this.width = 18.5,
      required this.updateSelectedItem});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        borderRadius: BorderRadius.circular(8),
        underline: const SizedBox(),
        style: Apptheme.ligthTheme.textTheme.titleSmall,
        icon: SizedBox(
          width: width.wp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_drop_down_outlined,
                color: AppColors.textSecondaryColor,
                size: 20.0.sp,
              ),
            ],
          ),
        ),
        items: itemsList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            updateSelectedItem(value);
          }
        },
        value: seletedItem);
  }
}
