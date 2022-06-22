import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../core/widgets/card_kpi.dart';
import 'halaman_kpi_controller.dart';

class HalamanKpiPage extends GetView<HalamanKpiController> {
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
                  onPressed: () {
                    Get.toNamed(Routes.HISTORY);
                  },
                  label: const Text('Riwayat'),
                  icon: SvgPicture.asset('assets/icons/history.svg'),
                ),
              ],
            ),
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
              label: const Text('Tambah KPI'),
              icon: SvgPicture.asset('assets/icons/plus.svg'),
            ),
          ]),
        ),
        const SizedBox(height: 11),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CardKpi(
                perusahaan: "PT. PUPUK INDONESIA",
                tanggal: "01 Januari 2021 - 31 Desember 2021",
                status: "Selesai",
                nama: "Nendra Ariyanto",
                jabatan: "VP Remunerisasi & Manj. Kinerja",
                unitKerja: "Departement Remunerasi & Manj. Kinerja",
              );
            },
          ),
        )
      ]),
    ));
  }
}
