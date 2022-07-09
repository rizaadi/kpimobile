import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../controllers/edit_kpi_controller.dart';

class EditKpiView extends GetView<EditKpiController> {
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
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: ThemeConfig.colors.Black_primary),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Edit KPI",
              style: Get.textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Text("Kategori",
                style: Get.textTheme.bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField(
                hint: const Text("Pilih Kategori",
                    style: TextStyle(fontSize: 13)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeConfig.colors.Gray_primary,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? value) {
                  dropdownvalue = value!;
                }),
            const SizedBox(height: 16),
            Text("KRA",
                style: Get.textTheme.bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField(
                hint: const Text("Pilih KRA", style: TextStyle(fontSize: 13)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeConfig.colors.Gray_primary,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
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
            CustomTextField(
              label: "Deskripsi",
              controller: controller.deskripsiC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Rumus",
              controller: controller.rumusC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Bobot (%)",
              controller: controller.bobotC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Target",
              controller: controller.targetC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Satuan",
              controller: controller.satuanC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Sumber Data",
              controller: controller.sumberDataC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Perlu Perhatian",
              controller: controller.perhatianC,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Nilai 4",
              controller: controller.nilai4C,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Nilai 3",
              controller: controller.nilai3C,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Nilai 2",
              controller: controller.nilai2C,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Nilai 1",
              controller: controller.nilai1C,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: 200,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          const Text(
                            "Anda yakin ingin Simpan KPI ?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("IYA")),
                          const SizedBox(height: 16),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: ThemeConfig.colors.Gray_primary,
                                minimumSize: const Size.fromHeight(50),
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
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/save.svg',
                  color: Colors.white,
                  width: 24,
                  height: 24,
                ),
                label: const Text("Simpan")),
          ]),
        )));
  }
}
