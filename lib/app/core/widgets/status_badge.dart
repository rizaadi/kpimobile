import 'package:flutter/material.dart';

import '../theme/theme_config.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: status == "Selesai"
              ? ThemeConfig.colors.Green_primary
              : status == "Draft"
                  ? ThemeConfig.colors.Gray_primary
                  : status == "Pending"
                      ? ThemeConfig.colors.Yellow_primary
                      : ThemeConfig.colors.Blue_primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        status,
        style: TextStyle(
            color: status == "Draft"
                ? ThemeConfig.colors.Black_primary
                : status == "Admin"
                    ? ThemeConfig.colors.Blue_primary
                    : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13),
      ),
    );
  }
}
