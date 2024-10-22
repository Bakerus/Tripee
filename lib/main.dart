import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Apptheme.ligthTheme,
    ),
  );
}
