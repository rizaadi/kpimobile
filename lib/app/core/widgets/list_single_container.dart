import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_config.dart';

class ListSingleContainer extends StatelessWidget {
  const ListSingleContainer({
    Key? key, required this.value,
  }) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: ThemeConfig.colors.Gray_primary,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
