import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardMonitor extends StatelessWidget {
  const CardMonitor(
      {Key? key,
      required this.asset,
      required this.status,
      required this.value})
      : super(key: key);

  final String status;
  final String asset;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Get.theme.cardColor,
        elevation: 5,
        shadowColor: Get.theme.cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Row(
                children: [
                  SvgPicture.asset(
                    asset,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Text(
                      value,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 6, bottom: 19),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ));
  }
}
