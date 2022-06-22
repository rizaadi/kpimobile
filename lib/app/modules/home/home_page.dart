import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/card_history.dart';
import 'package:kpimobile/app/core/widgets/card_monitor.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../core/theme/theme_config.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello", style: Get.theme.textTheme.headline5),
                  Text(
                    "Riza Adi Kurniawan",
                    style: Get.theme.textTheme.headline5
                        ?.copyWith(fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://s3-alpha.figma.com/profile/46915882-ffc5-4a0c-b3e9-663f14c427e0')),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HALAMANKPI);
                  },
                  child: CardMonitor(
                    asset: 'assets/icons/check-circle.svg',
                    status: 'Disetujui',
                    value: '1',
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HALAMANKPI);
                  },
                  child: CardMonitor(
                    asset: 'assets/icons/clock.svg',
                    status: 'Pending',
                    value: '1',
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HALAMANKPI);
                  },
                  child: CardMonitor(
                    asset: 'assets/icons/divide-circle.svg',
                    status: 'Ditolak',
                    value: '1',
                  ),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.HALAMANKPI);
                    },
                    child: CardMonitor(
                      asset: 'assets/icons/clipboard.svg',
                      status: 'Draft',
                      value: '1',
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "KPI Terakhir",
                style: Get.theme.textTheme.subtitle2,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.HALAMANKPI);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "Lihat Semua",
                    style: Get.theme.textTheme.subtitle2,
                  ))
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          const CardHistory(
            namaPerusahaan: "PT. PUPUK INDONESIA",
            periode: "01 Januari 2021 - 31 Desember 2021",
            status: "SELESAI",
          ),
          const CardHistory(
            namaPerusahaan: "PT. PUPUK INDONESIA",
            periode: "01 Januari 2021 - 31 Desember 2021",
            status: "SELESAI",
          ),
          const SizedBox(height: 30),
          const Text(
            "KPI",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
              onPressed: () {
                Get.defaultDialog(
                    title: "Form penyusunan KPI individu",
                    textCancel: "Cancel",
                    textConfirm: "Selanjutnya",
                    radius: 10,
                    titleStyle: const TextStyle(fontSize: 16),
                    titlePadding: const EdgeInsets.all(16),
                    contentPadding: const EdgeInsets.all(16),
                    buttonColor: Get.theme.primaryColor,
                    cancelTextColor: ThemeConfig.colors.Black_primary,
                    confirmTextColor: Colors.white,
                    cancel: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: ThemeConfig.colors.Gray_primary),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Batal",
                          style: TextStyle(color: Colors.black),
                        )),
                    confirm: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.DETAIL_KPI);
                        },
                        child: const Text("Selanjutnya")),
                    content: SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              hint: const Text("Periode Penyusunan KPI"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                dropdownvalue = value!;
                              }),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                              hint: const Text("Jabatan / Unit Kerja"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                dropdownvalue = value!;
                              })
                        ],
                      ),
                    ));
              },
              icon: const Icon(Icons.zoom_out_map_outlined),
              label: const Text("Tambah KPI"))
        ],
      )),
    );
  }
}
