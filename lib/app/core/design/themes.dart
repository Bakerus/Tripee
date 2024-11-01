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

// *****************************************************************************
// Apptheme
// 
// This class defines the application's theme, using Material Design 3 (MD3) 
// standards. It specifies a light theme that includes colors, typography, 
// button styles, and other visual elements. The theme leverages predefined 
// colors from the `AppColors` class to maintain consistency throughout the 
// app’s UI.
// 
// Key features:
// - Uses Material 3 design principles by setting `useMaterial3: true`.
// - Specifies the overall app color scheme using `AppColors`, including primary, 
//   secondary, and error colors, while adjusting contrast colors like 
//   `onPrimary` and `onSecondary`.
// - Defines a custom `fontFamily` ("PTSans") to ensure typographic consistency.
// - Customizes button themes (such as `IconButton` and `ElevatedButton`) and 
//   text styles for various UI elements using the `TextTheme`.
// 
// Usage:
// - This theme can be applied globally in the app using the `ThemeData` in the 
//   `MaterialApp` widget. Example usage: `theme: Apptheme.lightTheme`.
// 
// 
// *****************************************************************************