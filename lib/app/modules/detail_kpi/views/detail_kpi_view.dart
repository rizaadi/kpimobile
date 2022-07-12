import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/core/widgets/list_container.dart';
import 'package:kpimobile/app/core/widgets/list_three_container.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../../core/widgets/chip_approve_kpi.dart';
import '../../../core/widgets/custom_popupmenuitem.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../controllers/detail_kpi_controller.dart';

enum Options { History, Delete }

class DetailKpiView extends GetView<DetailKpiController> {
  @override
  Widget build(BuildContext context) {
    var idKpi = Get.arguments;
    log(name: "Role: ", controller.role.toString());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: controller.getDetailKpiKaryawan(idKpi),
                builder: (context, snapshot) {
                  var kpi = snapshot.data?.data();
                  print(kpi);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://ui-avatars.com/api/?background=26A0C9&color=fff&name=${kpi?['nama']}"),
                                    radius: 15),
                                const SizedBox(width: 6),
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
                                          kpi?['perusahaan'] ?? 'Kosong',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13),
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
                                          kpi?['periode'] ?? 'Kosong',
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                          PopupMenuButton(
                              onSelected: (value) => {
                                    if (value == Options.History.index)
                                      {Get.toNamed(Routes.HISTORY)}
                                    else if (value == Options.Delete.index)
                                      {controller.deleteKpi(idKpi)}
                                  },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              constraints: const BoxConstraints(maxWidth: 120),
                              itemBuilder: (context) => [
                                    customPopupMenuItem(
                                        'History',
                                        'assets/icons/history.svg',
                                        Get.theme.primaryColor,
                                        Options.History.index),
                                    customPopupMenuItem(
                                        'Delete',
                                        'assets/icons/trash-2.svg',
                                        Get.theme.errorColor,
                                        Options.Delete.index),
                                  ]),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Divider(height: 0),
                      const SizedBox(height: 15),
                      ListContainer(
                          title: "Nama Karyawan",
                          value: kpi?['nama'] ?? 'Kosong',
                          color: ThemeConfig.colors.Gray_primary),
                      ListContainer(
                          title: "Badge",
                          value: kpi?['badge'] ?? "Kosong",
                          color: Colors.white),
                      ListContainer(
                          title: "Jabatan",
                          value: kpi?['jabatan'] ?? "Kosong",
                          color: ThemeConfig.colors.Gray_primary),
                      ListContainer(
                          title: "Unit Kerja",
                          value: kpi?['unitKerja'] ?? "Kosong",
                          color: Colors.white),
                      ListThreeContainer(
                          name1: kpi?['atasan1'] ?? "Kosong",
                          name2: kpi?['atasan2'] ?? "Kosong",
                          name3: kpi?['atasan3'] ?? "Kosong",
                          color: ThemeConfig.colors.Gray_primary),
                      ListContainer(
                          title: "Status",
                          value: kpi?['status'][0] ?? "Kosong",
                          color: Colors.white),
                      const Divider(height: 1),
                      const SizedBox(height: 11),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                          children: const [
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/sliders.svg',
                                    width: 18,
                                    height: 18,
                                  ),
                                  label: const Text("Filter"),
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          ThemeConfig.colors.Green_primary)),
                              Visibility(
                                visible: ((controller.role == 'Atasan' &&
                                        kpi?['status'][0] != 'Draft' &&
                                        kpi?['status'][0] != 'Selesai' &&
                                        kpi?['status'][0] != 'Ditolak')) ||
                                    ((controller.role == 'Karyawan' &&
                                        kpi?['status'][0] == 'Draft')),
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      Get.toNamed(Routes.TAMBAH_KPI,
                                          arguments: idKpi);
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/icons/plus.svg',
                                        width: 18,
                                        height: 18),
                                    label: const Text("Tambah KPI"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            ThemeConfig.colors.Green_primary)),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: ((controller.role == 'Atasan' &&
                                    kpi?['status'][0] != 'Draft' &&
                                    kpi?['status'][0] != 'Selesai' &&
                                    kpi?['status'][0] != 'Ditolak')) ||
                                ((controller.role == 'Karyawan' &&
                                    kpi?['status'][0] == 'Draft')),
                            child: Obx(() => ElevatedButton.icon(
                                onPressed: () {
                                  if (controller.role == "Atasan") {
                                    Get.bottomSheet(
                                        Container(
                                            height: 250,
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                const Text(
                                                    "Anda yakin ingin submit KPI ?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(height: 34),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .terimaKpi(idKpi);
                                                      },
                                                      child: ChipApproveKpi(
                                                        name: "Terima",
                                                        asset:
                                                            'assets/icons/check-circle.svg',
                                                        color: ThemeConfig
                                                            .colors
                                                            .Blue_primary,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .tolakKpi(idKpi);
                                                      },
                                                      child: ChipApproveKpi(
                                                        name: "Tolak",
                                                        asset:
                                                            'assets/icons/x-circle.svg',
                                                        color: ThemeConfig
                                                            .colors.Red_primary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enableDrag: false);
                                  } else {
                                    Get.bottomSheet(
                                        Container(
                                          height: 200,
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              const Text(
                                                  "Anda yakin ingin submit KPI ?",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              const SizedBox(height: 20),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            50),
                                                  ),
                                                  onPressed: () {
                                                    controller.submitKpi(idKpi);
                                                  },
                                                  child: const Text("IYA")),
                                              const SizedBox(height: 16),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: ThemeConfig
                                                        .colors.Gray_primary,
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            50),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    "TIDAK",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enableDrag: false);
                                  }
                                },
                                icon: SvgPicture.asset(
                                  controller.role == 'Atasan'
                                      ? 'assets/icons/check-circle.svg'
                                      : 'assets/icons/send.svg',
                                  width: 18,
                                  height: 18,
                                  color: Colors.white,
                                ),
                                label: Text(controller.role == 'Atasan'
                                    ? 'Approve KPI'
                                    : "Submit KPI"))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 11),
                      Text("Total Bobot :  ${kpi?['totalBobot'] ?? "0"}%"),
                      SizedBox(
                        height: Get.height * 0.8,
                        width: 2000,
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                stream: controller.getListKpiKaryawan(idKpi),
                                builder: (context, snapshotlist) {
                                  var kpilist = snapshotlist.data?.docs;
                                  if (snapshotlist.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshotlist.data?.docs.length ==
                                          0 ||
                                      snapshotlist.data?.docs == null) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text("KPI belum diisi")),
                                    );
                                  } else if (snapshotlist.hasData) {
                                    if (controller.role == "Atasan") {
                                      return DataTable2(
                                        minWidth: 2000,
                                        horizontalMargin: 10,
                                        columnSpacing: 12,
                                        fixedLeftColumns: 1,
                                        dataRowHeight: 80,
                                        bottomMargin: 16,
                                        headingTextStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: ThemeConfig
                                                .colors.Black_primary),
                                        dividerThickness: 0,
                                        columns: const [
                                          DataColumn2(
                                            fixedWidth: 30,
                                            label: Text("No"),
                                          ),
                                          DataColumn2(
                                              fixedWidth: 90,
                                              label: Text("Kategori")),
                                          DataColumn2(
                                            fixedWidth: 90,
                                            label: Text("Bobot (%)"),
                                          ),
                                          DataColumn2(
                                              fixedWidth: 90,
                                              label: Text("Target")),
                                          DataColumn2(
                                            fixedWidth: 120,
                                            label: Text("Pencapaian KPI"),
                                          ),
                                          DataColumn2(
                                            fixedWidth: 140,
                                            label: Text("Grading Penilaian"),
                                          ),
                                          DataColumn2(
                                            fixedWidth: 170,
                                            label: Text("Aksi"),
                                          )
                                        ],
                                        rows: List<DataRow>.generate(
                                            kpilist?.length ?? 0,
                                            (index) => DataRow2(
                                                    color: MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            index.isEven
                                                                ? ThemeConfig
                                                                    .colors
                                                                    .Gray_primary
                                                                : Colors
                                                                    .transparent),
                                                    cells: [
                                                      DataCell(
                                                          Text("${index + 1}")),
                                                      DataCell(Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              kpilist?[index]
                                                                          .data()[
                                                                      "kategori"] ??
                                                                  "Kosong",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12)),
                                                          Text(
                                                              kpilist?[index]
                                                                          .data()[
                                                                      "kra"] ??
                                                                  "Kosong",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          12))
                                                        ],
                                                      )),
                                                      DataCell(Text(
                                                        kpilist?[index]
                                                                .data()["bobot"]
                                                                .toString() ??
                                                            "Kosong",
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                      DataCell(Text(
                                                        kpilist?[index].data()[
                                                                "target"] ??
                                                            "Kosong",
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                      DataCell(
                                                        Container(
                                                          width: 100,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                            kpilist?[index]
                                                                        .data()[
                                                                    "pencapaian"] ??
                                                                "Kosong",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Get.bottomSheet(
                                                              Container(
                                                                height: 330,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(16),
                                                                child: Column(
                                                                  children: [
                                                                    const Text(
                                                                        "Isi Pencapaian KPI",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    const SizedBox(
                                                                        height:
                                                                            34),
                                                                    CustomTextField(
                                                                      label:
                                                                          "Pencapaian KPI",
                                                                      controller:
                                                                          controller
                                                                              .pencapaianC,
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            34),
                                                                    ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          elevation:
                                                                              0,
                                                                          minimumSize:
                                                                              const Size.fromHeight(50),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          controller.addPencapaianKPIAtasan(
                                                                              idKpi,
                                                                              kpilist?[index].id);
                                                                        },
                                                                        child: const Text(
                                                                            "Simpan")),
                                                                    const SizedBox(
                                                                        height:
                                                                            16),
                                                                    ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          elevation:
                                                                              0,
                                                                          primary: ThemeConfig
                                                                              .colors
                                                                              .Gray_primary,
                                                                          minimumSize:
                                                                              const Size.fromHeight(50),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Batal",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w600),
                                                                        ))
                                                                  ],
                                                                ),
                                                              ),
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              enableDrag:
                                                                  false);
                                                        },
                                                      ),
                                                      DataCell(
                                                          Container(
                                                            width: 100,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Text(
                                                              kpilist?[index]
                                                                          .data()[
                                                                      "grading"] ??
                                                                  "Kosong",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          onTap: () => {
                                                                Get.bottomSheet(
                                                                    Container(
                                                                      height:
                                                                          305,
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              16),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const Text(
                                                                              "Isi Pencapaian KPI",
                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                                                          const SizedBox(
                                                                              height: 34),
                                                                          DropdownButtonFormField(
                                                                              // value: kpilist?[index].data()["grading"].toString() ?? "Kosong",
                                                                              hint: const Text("Pilih Kategori", style: TextStyle(fontSize: 13)),
                                                                              decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: ThemeConfig.colors.Gray_primary,
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              items: controller.gradingItem.map((String items) {
                                                                                return DropdownMenuItem(value: items, child: Text(items, style: const TextStyle(fontSize: 13)));
                                                                              }).toList(),
                                                                              onChanged: (String? value) {
                                                                                controller.gradingC.text = value!;
                                                                              }),
                                                                          const SizedBox(
                                                                              height: 34),
                                                                          ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                elevation: 0,
                                                                                minimumSize: const Size.fromHeight(50),
                                                                              ),
                                                                              onPressed: () {
                                                                                controller.addGradingKPIAtasan(idKpi, kpilist?[index].id);
                                                                              },
                                                                              child: const Text("Simpan")),
                                                                          const SizedBox(
                                                                              height: 16),
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
                                                                                "Batal",
                                                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    enableDrag:
                                                                        false)
                                                              }),
                                                      DataCell(Row(
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                //TODO: Display description/note for each kpi (chat)
                                                                Get.bottomSheet(
                                                                  Container(
                                                                    height: 200,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            16),
                                                                    decoration: const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20),
                                                                            topRight: Radius.circular(20))),
                                                                    child:
                                                                        Column(
                                                                      children: const [
                                                                        Text(
                                                                          "Anda yakin ingin Hapus KPI ?",
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                20),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: SvgPicture
                                                                  .asset(
                                                                'assets/icons/file-text.svg',
                                                                width: 24,
                                                                height: 24,
                                                              )),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Get.toNamed(
                                                                    Routes
                                                                        .EDIT_KPI,
                                                                    arguments: [
                                                                      kpilist?[
                                                                              index]
                                                                          .data(),
                                                                      idKpi,
                                                                      kpilist?[
                                                                              index]
                                                                          .id
                                                                    ]);
                                                              },
                                                              icon: SvgPicture
                                                                  .asset(
                                                                      'assets/icons/edit.svg')),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Get.bottomSheet(
                                                                  Container(
                                                                    height: 200,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            16),
                                                                    decoration: const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20),
                                                                            topRight: Radius.circular(20))),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        const Text(
                                                                          "Anda yakin ingin Hapus KPI ?",
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                20),
                                                                        ElevatedButton(
                                                                            style: ElevatedButton
                                                                                .styleFrom(
                                                                              elevation: 0,
                                                                              minimumSize: const Size.fromHeight(50),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              controller.deleteKpiUser(idKpi, kpilist?[index].id);
                                                                            },
                                                                            child:
                                                                                const Text("IYA")),
                                                                        const SizedBox(
                                                                            height:
                                                                                16),
                                                                        ElevatedButton(
                                                                            style: ElevatedButton
                                                                                .styleFrom(
                                                                              elevation: 0,
                                                                              primary: ThemeConfig.colors.Gray_primary,
                                                                              minimumSize: const Size.fromHeight(50),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "TIDAK",
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: SvgPicture
                                                                  .asset(
                                                                'assets/icons/trash-2.svg',
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                        ],
                                                      )),
                                                    ])),
                                      );
                                    }
                                    return DataTable2(
                                      minWidth: 2000,
                                      horizontalMargin: 10,
                                      columnSpacing: 12,
                                      fixedLeftColumns: 1,
                                      dataRowHeight: 80,
                                      bottomMargin: 16,
                                      headingTextStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              ThemeConfig.colors.Black_primary),
                                      dividerThickness: 0,
                                      columns: const [
                                        DataColumn2(
                                          fixedWidth: 30,
                                          label: Text("No"),
                                        ),
                                        DataColumn2(
                                            fixedWidth: 90,
                                            label: Text("Kategori")),
                                        DataColumn2(
                                          fixedWidth: 90,
                                          label: Text("Bobot (%)"),
                                        ),
                                        DataColumn2(
                                            fixedWidth: 90,
                                            label: Text("Target")),
                                        DataColumn2(
                                          fixedWidth: 110,
                                          label: Text("Nilai 1"),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 170,
                                          label: Text("Aksi"),
                                        )
                                      ],
                                      rows: List<DataRow>.generate(
                                          kpilist?.length ?? 0,
                                          (index) => DataRow2(
                                                  color: MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          index.isEven
                                                              ? ThemeConfig
                                                                  .colors
                                                                  .Gray_primary
                                                              : Colors
                                                                  .transparent),
                                                  cells: [
                                                    DataCell(
                                                        Text("${index + 1}")),
                                                    DataCell(Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            kpilist?[index]
                                                                        .data()[
                                                                    "kategori"] ??
                                                                "Kosong",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12)),
                                                        Text(
                                                            kpilist?[index]
                                                                        .data()[
                                                                    "kra"] ??
                                                                "Kosong",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12))
                                                      ],
                                                    )),
                                                    DataCell(Text(
                                                      kpilist?[index]
                                                              .data()["bobot"]
                                                              .toString() ??
                                                          "Kosong",
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                    DataCell(Text(
                                                      kpilist?[index].data()[
                                                              "target"] ??
                                                          "Kosong",
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                    DataCell(Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "1. ${kpilist?[index].data()["nilai1"] ?? "Kosong"}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          "2. ${kpilist?[index].data()["nilai2"] ?? "Kosong"}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          "3. ${kpilist?[index].data()["nilai3"] ?? "Kosong"}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          "4. ${kpilist?[index].data()["nilai4"] ?? "Kosong"}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    )),
                                                    DataCell(Row(
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              //TODO: Display description/note for each kpi (chat)
                                                              Get.bottomSheet(
                                                                Container(
                                                                  height: 200,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(16),
                                                                  decoration: const BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              20),
                                                                          topRight:
                                                                              Radius.circular(20))),
                                                                  child: Column(
                                                                    children: const [
                                                                      Text(
                                                                        "Anda yakin ingin Hapus KPI ?",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              20),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            icon: SvgPicture
                                                                .asset(
                                                              'assets/icons/file-text.svg',
                                                              width: 24,
                                                              height: 24,
                                                            )),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .EDIT_KPI,
                                                                  arguments: [
                                                                    kpilist?[
                                                                            index]
                                                                        .data(),
                                                                    idKpi,
                                                                    kpilist?[
                                                                            index]
                                                                        .id
                                                                  ]);
                                                            },
                                                            icon: SvgPicture.asset(
                                                                'assets/icons/edit.svg')),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.bottomSheet(
                                                                Container(
                                                                  height: 200,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(16),
                                                                  decoration: const BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              20),
                                                                          topRight:
                                                                              Radius.circular(20))),
                                                                  child: Column(
                                                                    children: [
                                                                      const Text(
                                                                        "Anda yakin ingin Hapus KPI ?",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              20),
                                                                      ElevatedButton(
                                                                          style: ElevatedButton
                                                                              .styleFrom(
                                                                            elevation:
                                                                                0,
                                                                            minimumSize:
                                                                                const Size.fromHeight(50),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            controller.deleteKpiUser(idKpi,
                                                                                kpilist?[index].id);
                                                                          },
                                                                          child:
                                                                              const Text("IYA")),
                                                                      const SizedBox(
                                                                          height:
                                                                              16),
                                                                      ElevatedButton(
                                                                          style: ElevatedButton
                                                                              .styleFrom(
                                                                            elevation:
                                                                                0,
                                                                            primary:
                                                                                ThemeConfig.colors.Gray_primary,
                                                                            minimumSize:
                                                                                const Size.fromHeight(50),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "TIDAK",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            icon: SvgPicture
                                                                .asset(
                                                              'assets/icons/trash-2.svg',
                                                              color: Colors.red,
                                                            )),
                                                      ],
                                                    )),
                                                  ])),
                                    );
                                  }
                                  return Text("Data tidak ada");
                                }),
                      )
                    ],
                  );
                }),
          )),
        ),
      ),
    );
  }
}
