
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
  final List<String> _chipLabel = ['Ditolak', 'Pending', 'Selesai', 'Draft'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: TextField(
              onChanged: (value) => controller.runFilter(value),
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
                          height: 150,
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
                              Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.start,
                                children: [
                                  const Text("Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  Obx(
                                    () => Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing: 10,
                                      children:
                                          List<Widget>.generate(4, (int index) {
                                        return ChoiceChip(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            selectedColor:
                                                ThemeConfig.colors.Blue_primary,
                                            labelStyle: TextStyle(
                                                color: ThemeConfig
                                                    .colors.Black_primary),
                                            label: Text(_chipLabel[index]),
                                            selected: controller.selectedChip ==
                                                index,
                                            onSelected: (bool selected) {
                                              controller.selectedChip =
                                                  selected ? index : null;
                                              controller.filterChip(
                                                  controller.selectedChip);
                                            });
                                      }),
                                    ),
                                  )
                                ],
                              )
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
            Obx(
              () => Visibility(
                visible: controller.role == "Karyawan" ? true : false,
                child: ElevatedButton.icon(
                  label: const Text('Tambah KPI'),
                  icon: SvgPicture.asset('assets/icons/plus.svg'),
                  onPressed: () {
                    // TODO: Tambah filter input kosong
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
                                  items: controller.periodeItem
                                      .map((String items) {
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
                // FIXME: setelah tambah kpi, ke detail dan kembali lagi ke list, kpi belum update
                if (snapshot.hasData) {
                  List<Map<String, dynamic>>? dataKpi =
                      snapshot.data?.docs.map((e) => e.data()).toList();
                  controller.allKpi.value = dataKpi!;
                }
                return Obx(() => ListView.builder(
                      itemCount: controller.results.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic>? kpi =
                            controller.results.elementAt(index);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          //TODO: Change to loading skeleton
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_KPI,
                                  arguments: kpi?['id']);
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
                    ));
              }),
        )
      ]),
    ));
  }
}
