import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PopupMenuItem customPopupMenuItem(
    String name, String icon, Color color, int position) {
  return PopupMenuItem(
    value: position,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          color: color,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        )
      ],
    ),
  );
}
