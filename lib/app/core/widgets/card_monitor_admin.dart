import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';

class CardMonitorAdmin extends StatelessWidget {
  const CardMonitorAdmin({Key? key, required this.status, required this.value}) : super(key: key);

  final String status;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 13,
                top: 16,
              ),
              child: Text(
                status,
                style: Get.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.w600, color: ThemeConfig.colors.Blue_primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 18, bottom: 18),
              child: Text(
                value,
                maxLines: 1,
                style: TextStyle(color: ThemeConfig.colors.Blue_primary, fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
