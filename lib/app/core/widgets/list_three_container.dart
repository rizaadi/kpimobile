import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListThreeContainer extends StatelessWidget {
  const ListThreeContainer({
    Key? key,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.color,
  }) : super(key: key);

  final String name1;
  final String name2;
  final String name3;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Atasan Langsung", style: TextStyle(fontSize: 12)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  Text(
                    name2,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  Text(
                    name3,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
