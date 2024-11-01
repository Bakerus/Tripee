import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      content: SizedBox(
        height: 20.0.hp,
        width: 20.0.wp,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
