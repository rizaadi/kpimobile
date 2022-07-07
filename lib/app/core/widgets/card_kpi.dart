import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../theme/theme_config.dart';

class CardKpi extends StatelessWidget {
  const CardKpi({
    Key? key,
    required this.perusahaan,
    required this.tanggal,
    required this.status,
    required this.nama,
    required this.jabatan,
    required this.unitKerja,
  }) : super(key: key);

  final String perusahaan;
  final String tanggal;
  final String status;
  final String nama;
  final String jabatan;
  final String unitKerja;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 11),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://ui-avatars.com/api/?background=26A0C9&color=fff&name=$nama'),
                        radius: 15),
                    const SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/briefcase.svg',
                              color: Colors.black,
                              height: 12,
                              width: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              perusahaan,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
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
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: status == "Selesai"
                            ? ThemeConfig.colors.Green_primary
                            : ThemeConfig.colors.Gray_primary,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      status,
                      style: TextStyle(
                          color: status == "Selesai"
                              ? Colors.white
                              : ThemeConfig.colors.Black_primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.DETAIL_KPI);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ]),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(height: 1),
            const SizedBox(height: 15),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: ThemeConfig.colors.Gray_primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Nama Karyawan",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(
                        width: 220,
                        child: Text(
                          nama,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11),
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jabatan", style: TextStyle(fontSize: 12)),
                      SizedBox(
                        width: 220,
                        child: Text(
                          jabatan,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11),
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: ThemeConfig.colors.Gray_primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Unit Kerja", style: TextStyle(fontSize: 12)),
                      SizedBox(
                        width: 220,
                        child: Text(
                          unitKerja,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11),
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Status", style: TextStyle(fontSize: 12)),
                      SizedBox(
                        width: 220,
                        child: Text(
                          status,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
      // color: ThemeConfig.colors.Black_primary,
    );
  }
}
