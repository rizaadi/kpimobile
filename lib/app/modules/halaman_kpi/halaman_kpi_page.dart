import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../core/widgets/card_kpi.dart';
import 'halaman_kpi_controller.dart';

class HalamanKpiPage extends GetView<HalamanKpiController> {
  var arg = Get.arguments;
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
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              const Text(
                                "Filter",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                    label: const Text("Filter"),
                    icon: SvgPicture.asset('assets/icons/sliders.svg'),
                    style: ElevatedButton.styleFrom(
                        primary: ThemeConfig.colors.Green_primary)),
                ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.HISTORY);
                    },
                    label: const Text('Riwayat'),
                    icon: SvgPicture.asset('assets/icons/history.svg'),
                    style: ElevatedButton.styleFrom(
                        primary: ThemeConfig.colors.Green_primary)),
              ],
            ),
            Visibility(
              visible: controller.role == "Atasan" ? true : false,
              child: ElevatedButton.icon(
                label: const Text('Tambah KPI'),
                icon: SvgPicture.asset('assets/icons/plus.svg'),
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
                            controller.addKpi();
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
                                items:
                                    controller.periodeItem.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,
                                        style: const TextStyle(fontSize: 13)),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  controller.periodeC.text = value!;
                                }),
                            const SizedBox(height: 16),
                            DropdownButtonFormField(
                                isExpanded: true,
                                hint: const Text("Jabatan / Unit Kerja"),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                items: controller.jabatanUnitItem
                                    .map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  controller.jabatanC.text = value!;
                                })
                          ],
                        ),
                      ));
                },
              ),
            ),
          ]),
        ),
        const SizedBox(height: 11),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: arg == "listkpi"
                  ? controller.getListKpiAtasan()
                  : arg == "approval"
                      ? controller.getListKpiApprovalAtasan()
                      : controller.getListKpiKaryawan(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.size,
                  itemBuilder: (context, index) {
                    Map<String, dynamic>? kpi =
                        snapshot.data?.docs.elementAt(index).data();
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      //TODO: Change to loading skeleton
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_KPI, arguments: kpi?['id']);
                        },
                        child: CardKpi(
                          perusahaan: kpi?['perusahaan'] ?? 'Kosong',
                          tanggal: kpi?['periode'] ?? 'Kosong',
                          status: kpi?['status'][0] ?? 'Kosong',
                          nama: kpi?['nama'] ?? 'Kosong',
                          jabatan: kpi?['jabatan'] ?? 'Kosong',
                          unitKerja: kpi?['unitKerja'] ?? 'Kosong',
                        ),
                      );
                    } else {
                      return const Center(child: Text("Tidak ada data"));
                    }
                  },
                );
              }),
        )
      ]),
    ));
  }
}
