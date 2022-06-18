import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/card_history.dart';
import 'package:kpimobile/app/core/widgets/card_monitor.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
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
                  const Text("Hello",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(
                    "Riza Adi Kurniawan",
                    style: Get.theme.textTheme.headline5,
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
            children: const [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 8),
                child: CardMonitor(
                  asset: 'assets/icons/check-circle.svg',
                  status: 'Disetujui',
                  value: '1',
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: CardMonitor(
                  asset: 'assets/icons/clock.svg',
                  status: 'Pending',
                  value: '1',
                ),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 8),
                child: CardMonitor(
                  asset: 'assets/icons/divide-circle.svg',
                  status: 'Ditolak',
                  value: '1',
                ),
              )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CardMonitor(
                    asset: 'assets/icons/clipboard.svg',
                    status: 'Draft',
                    value: '1',
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
              onPressed: () {},
              icon: const Icon(Icons.zoom_out_map_outlined),
              label: const Text("Tambah KPI"))
        ],
      )),
    );
  }
}
