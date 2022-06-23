import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
// final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: Get.textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 6),
      TextField(
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 13),
          hintText: label,
          filled: true,
          fillColor: ThemeConfig.colors.Gray_primary,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ]);
  }
}
