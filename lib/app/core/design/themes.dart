import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';

class Apptheme {
  static final ligthTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.grayColor,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.sceondaryColor,
      onSecondary: AppColors.white,
      tertiary: AppColors.tertiaryColor,
      onSurface: AppColors.tertiaryColor,
      surface: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      brightness: Brightness.light,
    ),
    fontFamily: "PTSans",
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppColors.textSecondaryColor),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.tertiaryColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.tertiaryColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.tertiaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondaryColor,
      ),
      titleLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.textColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 15, vertical: 17)),
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColors.borderColor),
            foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )))),
  );
}
