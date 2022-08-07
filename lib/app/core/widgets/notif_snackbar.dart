import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_config.dart';

SnackbarController notifSnackBar(title, value) {
  return Get.snackbar(title, value,
      backgroundColor: Colors.white,
      colorText: ThemeConfig.colors.Black_primary,
      margin: const EdgeInsets.all(16),
      snackStyle: SnackStyle.FLOATING);
}
