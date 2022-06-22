import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../controllers/detail_kpi_controller.dart';

class DetailKpiView extends GetView<DetailKpiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                              "01 Januari 2021 - 31 Desember 2021",
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/history.svg',
                          color: Get.theme.primaryColor,
                          width: 24,
                          height: 24,
                        ))
                  ],
                ),
                const SizedBox(height: 6),
                const Divider(height: 0),
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
                          Text(
                            "Nama Karyawan",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Nendra Ariyanto",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          )
                        ]),
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bagde", style: TextStyle(fontSize: 12)),
                          Text(
                            "1200051",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          )
                        ]),
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Jabatan", style: TextStyle(fontSize: 12)),
                          Text(
                            "VP Remunerisasi & Manj. Kinerja",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          )
                        ]),
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Unit Kerja", style: TextStyle(fontSize: 12)),
                          Expanded(
                            child: Text(
                              "Departement Remunerasi & Manj. Kinerja",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Atasan Langsung",
                              style: TextStyle(fontSize: 12)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Joko Wido Harjoso",
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                              Text(
                                "SVP Sumber Daya Manusia",
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                              Text(
                                "Kompartemen Sumber Daya Manusia",
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Status", style: TextStyle(fontSize: 12)),
                          Text(
                            "Draft",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          )
                        ]),
                  ),
                ),
                const Divider(height: 1),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 4,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/sliders.svg',
                              width: 18,
                              height: 18,
                            ),
                            label: const Text("Filter")),
                        ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(Routes.TAMBAH_KPI);
                            },
                            icon: SvgPicture.asset('assets/icons/plus.svg',
                                width: 18, height: 18),
                            label: const Text("Tambah KPI")),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Get.bottomSheet(
                              Container(
                                height: 200,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    const Text("Anda yakin ingin submit KPI ?"),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize:
                                              const Size.fromHeight(50),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("IYA")),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary:
                                              ThemeConfig.colors.Gray_primary,
                                          minimumSize:
                                              const Size.fromHeight(50),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          "TIDAK",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ))
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enableDrag: false);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/send.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white,
                        ),
                        label: const Text("Submit KPI")),
                  ],
                ),
                const SizedBox(height: 11),
                Text("Total Bobot :  0% (Strategis: 0% | Teknis: 0%)")
              ],
            ),
          )),
        ),
      ),
    );
  }
}
