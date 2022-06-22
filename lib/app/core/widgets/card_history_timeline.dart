
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/theme_config.dart';

class CardHistoryTimeline extends StatelessWidget {
  const CardHistoryTimeline({
    Key? key,
    required this.nama,
    required this.jabatan,
    required this.unitKerja,
    required this.lampiran,
    required this.tanggal,
    required this.status,
  }) : super(key: key);

  final String tanggal;
  final String status;
  final String nama;
  final String jabatan;
  final String unitKerja;
  final String lampiran;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    color: Colors.black,
                    height: 12,
                    width: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    tanggal,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: ThemeConfig.colors.Gray_primary,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  status,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
              )
            ],
          ),
          const Divider(thickness: 1),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeConfig.colors.Gray_primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(nama, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(jabatan, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeConfig.colors.Gray_primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(unitKerja, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(lampiran, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ]),
      ),
    );
  }
}
