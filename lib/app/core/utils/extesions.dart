import 'package:get/get.dart';

extension PercentSized on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

// 
// This file provides two extensions on the `double` type to facilitate responsive 
// design in Flutter applications. By leveraging these extensions, developers can 
// easily define sizes (height, width, and text scaling) as a percentage of the 
// device's screen dimensions. These methods help in creating flexible, adaptive 
// UIs that adjust to various screen sizes, ensuring a consistent look and feel 
// across different devices.
// 
// Key features:
// - PercentSized Extension: This extension adds methods to convert percentages 
//   of the total screen height (`hp`) and width (`wp`) to pixel values, making 
//   it easier to define UI element dimensions based on the screen size.
// - ResponsiveText Extension: This extension provides a method to scale font sizes 
//   (`sp`) based on the screen width, ensuring that text remains appropriately 
//   sized on different screen resolutions.
// 
// Usage:
// - To use, simply append `.hp`, `.wp`, or `.sp` to a double value, which 
//   represents the percentage of the screen height, width, or a responsive text size.
//   Example: `20.0.hp` will calculate 20% of the device's height.
// 
// *****************************************************************************