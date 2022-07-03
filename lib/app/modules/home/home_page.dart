import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/card_history.dart';
import 'package:kpimobile/app/core/widgets/card_monitor.dart';
import 'package:kpimobile/app/core/widgets/card_monitor_admin.dart';
import 'package:kpimobile/app/core/widgets/status_badge.dart';
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
  String users = "Atasan";
  @override
  Widget build(BuildContext context) {
    if (users == "Atasan") {
      return halamanAtasan();
    } else {
      return halamanKaryawan();
    }
  }

  Scaffold halamanKaryawan() {
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
          Text("Status KPI",
              style: Get.theme.textTheme.subtitle1
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'On Track',
                  value: '1',
                ),
              )),
              const SizedBox(width: 6),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'Behind Target',
                  value: '19',
                ),
              )),
              const SizedBox(width: 6),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'Inactive',
                  value: '1',
                ),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Text("Approval Request",
              style: Get.theme.textTheme.subtitle1
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'KPI',
                  value: '7',
                ),
              )),
              const SizedBox(width: 6),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'Monitoring',
                  value: '4',
                ),
              )),
              const SizedBox(width: 6),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HALAMANKPI);
                },
                child: CardMonitor(
                  status: 'Penilaian',
                  value: '12',
                ),
              )),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("KPI Terakhir",
                  style: Get.theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w600)),
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
                    style: Get.theme.textTheme.bodyText2,
                  ))
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          const CardHistory(
            namaPerusahaan: "PT. PUPUK INDONESIA",
            periode: "01 Januari 2021 - 31 Desember 2021",
            status: "Selesai",
          ),
          const CardHistory(
            namaPerusahaan: "PT. PUPUK INDONESIA",
            periode: "01 Januari 2021 - 31 Desember 2021",
            status: "Selesai",
          ),
          const SizedBox(height: 30),
          Text(
            "KPI",
            style: Get.theme.textTheme.subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
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

  Scaffold halamanAtasan() {
    return Scaffold(
      backgroundColor: ThemeConfig.colors.Gray_primary,
      body: SafeArea(
          child: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(16, 38, 16, 25),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://s3-alpha.figma.com/profile/46915882-ffc5-4a0c-b3e9-663f14c427e0')),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riza Adi Kurniawanz",
                      style: Get.theme.textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    StatusBadge(status: "Admin")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'On Track',
                        value: '1',
                      ),
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'Behind Target',
                        value: '19',
                      ),
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'Inactive',
                        value: '1',
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'KPI',
                        value: '7',
                      ),
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'Monitoring',
                        value: '4',
                      ),
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HALAMANKPI);
                      },
                      child: CardMonitorAdmin(
                        status: 'Penilaian',
                        value: '12',
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "KPI",
                style: Get.theme.textTheme.subtitle1
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 13),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.32),
                                  blurRadius: 29,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check-circle.svg',
                              color: ThemeConfig.colors.Blue_primary,
                              height: 36,
                              width: 36,
                            ),
                            const SizedBox(height: 6),
                            Text("Approval",
                                style: Get.textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            Text("2 Waiting Approval")
                          ],
                        )),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 13),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.32),
                                  blurRadius: 29,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/list.svg',
                              color: ThemeConfig.colors.Blue_primary,
                              height: 36,
                              width: 36,
                            ),
                            const SizedBox(height: 6),
                            Text("List KPI",
                                style: Get.textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            Text("2 KPI")
                          ],
                        )),
                  ),
                ],
              )
            ]),
          ),
          const SizedBox(height: 30),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("KPI Terakhir",
                          style: Get.theme.textTheme.subtitle1
                              ?.copyWith(fontWeight: FontWeight.w600)),
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
                            style: Get.theme.textTheme.bodyText2,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const CardHistory(
                    namaPerusahaan: "PT. PUPUK INDONESIA",
                    periode: "01 Januari 2021 - 31 Desember 2021",
                    status: "Selesai",
                  ),
                  const CardHistory(
                    namaPerusahaan: "PT. PUPUK INDONESIA",
                    periode: "01 Januari 2021 - 31 Desember 2021",
                    status: "Selesai",
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
