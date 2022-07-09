import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/core/widgets/custom_textfield.dart';

import '../controllers/tambah_kpi_controller.dart';

class TambahKpiView extends GetView<TambahKpiController> {
  String dropdownvalueKategori = 'Kosong';
  String dropdownvalueKRA = 'Kosong';
  var idKpi = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: ThemeConfig.colors.Black_primary),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Tambah KPI",
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
                borderRadius: BorderRadius.circular(10),
                items: controller.kategoriItem.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items, style: const TextStyle(fontSize: 13)));
                }).toList(),
                onChanged: (String? value) {
                  controller.kategoriC.text = value!;
                }),
            const SizedBox(height: 16),
            Text("KRA",
                style: Get.textTheme.bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField(
                isExpanded: true,
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
                borderRadius: BorderRadius.circular(10),
                items: controller.kra.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  controller.kraC.text = value!;
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
            CustomTextField(
              label: "Catatan",
              controller: controller.catatanC,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  controller.validatorText();
                  if (!controller.isTextEmpty.value) {
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
                                  controller.addGetKpi(idKpi);
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
                  }
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
