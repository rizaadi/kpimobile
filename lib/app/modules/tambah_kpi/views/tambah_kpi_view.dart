import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/core/widgets/custom_textfield.dart';

import '../controllers/tambah_kpi_controller.dart';

class TambahKpiView extends GetView<TambahKpiController> {
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
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Tambah KPI",
              style: Get.textTheme.headline5,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
                hint: const Text("Pilih Kategori"),
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
            const SizedBox(height: 12),
            DropdownButtonFormField(
                hint: const Text("Pilih KRA"),
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
            const SizedBox(height: 12),
            const CustomTextField(label: "Deksripsi"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Rumus"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Bobot (%)"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Target"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Satuan"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Sumber Data"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Perlu Perhatian"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Nilai 4"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Nilai 3"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Nilai 2"),
            const SizedBox(height: 12),
            const CustomTextField(label: "Nilai 1"),
            const SizedBox(height: 12),
            ElevatedButton.icon(
                onPressed: () {},
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
