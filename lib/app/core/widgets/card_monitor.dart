import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardMonitor extends StatelessWidget {
  const CardMonitor({Key? key, required this.status, required this.value}) : super(key: key);

  final String status;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Get.theme.cardColor,
        elevation: 5,
        shadowColor: Get.theme.cardColor,
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
                style: Get.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 18, bottom: 18),
              child: Text(
                value,
                maxLines: 1,
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
