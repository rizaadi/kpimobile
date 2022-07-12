import 'package:flutter/material.dart';

import '../theme/theme_config.dart';

class ContainerNotif extends StatelessWidget {
  const ContainerNotif({
    Key? key,
    required this.tanggal,
    required this.deskripsi,
  }) : super(key: key);
  final String tanggal;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeConfig.colors.blue_gradient_primary.withOpacity(0.12),
            ThemeConfig.colors.blue_gradient_second.withOpacity(0.12),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tanggal,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(deskripsi)
        ],
      ),
    );
  }
}
