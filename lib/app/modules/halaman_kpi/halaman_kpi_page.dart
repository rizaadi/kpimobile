import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';

import 'halaman_kpi_controller.dart';

class HalamanKpiPage extends GetView<HalamanKpiController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: TextField(
              decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: ThemeConfig.colors.Black_primary),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6)),
          )),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Wrap(
              spacing: 4,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text("Filter"),
                  icon: SvgPicture.asset('assets/icons/sliders.svg'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Riwayat'),
                  icon: SvgPicture.asset('assets/icons/history.svg'),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Tambah KPI'),
              icon: SvgPicture.asset('assets/icons/plus.svg'),
            ),
          ]),
        ),
        const SizedBox(height: 11),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
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
                                    "PT. PUPUK INDONESIA",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
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
                                    "01 Januari 2021 - 31 Desember 2021",
                                    style: const TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Selesai",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        color: ThemeConfig.colors.Gray_primary,
                        width: Get.width,
                        height: 1,
                      ),
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
                                Text("Nama Karyawan"),
                                Text(
                                  "Nendra Ariyanto",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jabatan"),
                                Text(
                                  "VP Remunerisasi & Manj. Kinerja",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
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
                                Text("Unit Kerja"),
                                Expanded(
                                  child: Text(
                                    "Departement Remunerasi & Manj. Kinerja",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Status"),
                                Text(
                                  "Draft",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                // color: ThemeConfig.colors.Black_primary,
              );
            },
          ),
        )
      ]),
    ));
  }
}
