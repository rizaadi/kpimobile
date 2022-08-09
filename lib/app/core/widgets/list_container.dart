import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  final String title;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          )
        ]),
      ),
    );
  }
}
