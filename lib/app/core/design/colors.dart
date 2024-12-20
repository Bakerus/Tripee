import 'package:flutter/material.dart';

class AppColors {
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const primaryColor = Color.fromRGBO(193, 71, 2, 1);
  static const sceondaryColor = Color.fromRGBO(30, 30, 30, 1);
  static const tertiaryColor = Color.fromRGBO(6, 18, 55, 1);
  static const textSecondaryColor = Color.fromRGBO(93, 93, 93, 1);
  static const textPlaceholderColor = Color.fromRGBO(181, 181, 181, 1);
  static const borderColor = Color.fromRGBO(222, 222, 222, 1);
  static const grayColor = Color.fromRGBO(248, 249, 253, 1);
  static const darkColor = Color.fromRGBO(1, 0, 13, 1);
  static const textColor = Color.fromRGBO(19, 19, 19, 1);
  static const backgroundColor = Color.fromRGBO(250, 250, 250, 1);
  static const redColor = Color.fromRGBO(235, 87, 87, 1);
}


// *****************************************************************************
// AppColors
// 
// This class provides a centralized definition of the application's color 
// palette. It defines static constants for frequently used colors throughout 
// the application, promoting consistency and ease of maintenance for UI 
// elements that depend on color styling.
// 
// Key features:
// - Defines various custom colors, including primary, secondary, tertiary, 
//   text, border, and background colors, as well as special use colors such 
//   as red for alerts.
// - Colors are represented using the `Color.fromRGBO` method, which specifies 
//   the red, green, blue, and opacity values.
// 
// Usage:
// - Use these predefined colors throughout the app to ensure a consistent 
//   color scheme. Example usage in a widget: `AppColors.primaryColor`
// 
// *****************************************************************************