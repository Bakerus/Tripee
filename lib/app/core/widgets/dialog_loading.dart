import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.wp),
      width: 3.0.wp,
      height: 25.0.hp,
      child: AlertDialog(
        scrollable: true,
        backgroundColor: const Color.fromARGB(206, 255, 255, 255),
        content: Center(
          child: SizedBox(
            width: 17.0.wp,
            height: 8.0.hp,
            child: const CircularProgressIndicator(
              strokeWidth: 5,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
