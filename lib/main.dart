import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'app/core/bindings/application_bindings.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KPI Mobile',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeConfig().getThemeData,
    ),
  );
}
