import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme_config.dart';

class ChipApproveKpi extends StatelessWidget {
  const ChipApproveKpi({
    Key? key,
    required this.asset,
    required this.color,
    required this.name,
  }) : super(key: key);
  final String asset;
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(36, 24, 36, 24),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: color, width: 2)),
      child: Column(children: [
        SvgPicture.asset(
          asset,
          width: 48,
          height: 48,
          color: color,
        ),
        const SizedBox(height: 10),
        Text(name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
      ]),
    );
  }
}
