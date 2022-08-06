import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kpimobile/app/core/widgets/card_history_timeline.dart';
import 'package:timelines/timelines.dart';

import '../../../core/theme/theme_config.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final historyC = Get.put(HistoryController());
  final List<String> _chipLabel = ['Ditolak', 'Pending', 'Selesai', 'Draft'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Riwayat KPI",
          style: Get.textTheme.headline5,
        ),
        const SizedBox(height: 16),
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
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Obx(
                            () => Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: List<Widget>.generate(4, (int index) {
                                return ChoiceChip(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    selectedColor:
                                        ThemeConfig.colors.Blue_primary,
                                    labelStyle: TextStyle(
                                        color:
                                            ThemeConfig.colors.Black_primary),
                                    label: Text(_chipLabel[index]),
                                    selected: controller.selectedChip == index,
                                    onSelected: (bool selected) {
                                      controller.selectedChip =
                                          selected ? index : null;
                                      controller
                                          .filterChip(controller.selectedChip);
                                      print(controller.selectedChip);
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
            icon: SvgPicture.asset('assets/icons/sliders.svg'),
            label: const Text("Filter"),
            style: ElevatedButton.styleFrom(
                primary: ThemeConfig.colors.Green_primary)),
        const SizedBox(height: 16),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: historyC.getListKpi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>>? dataKpi =
                      snapshot.data?.docs.map((e) => e.data()).toList();
                  controller.allKpi.addAll(dataKpi!);
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text("No Connections");
                    case ConnectionState.waiting:
                      //TODO: Add loading indicator
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return Obx(() => Timeline.tileBuilder(
                          theme: TimelineThemeData(
                              indicatorPosition: 0.1,
                              nodePosition: 0,
                              color: Get.theme.primaryColor,
                              indicatorTheme:
                                  const IndicatorThemeData(size: 14),
                              connectorTheme:
                                  const ConnectorThemeData(thickness: 2)),
                          shrinkWrap: true,
                          builder: TimelineTileBuilder.connectedFromStyle(
                              firstConnectorStyle: ConnectorStyle.transparent,
                              lastConnectorStyle: ConnectorStyle.transparent,
                              connectorStyleBuilder: (context, index) =>
                                  ConnectorStyle.solidLine,
                              indicatorStyleBuilder: (context, index) =>
                                  IndicatorStyle.dot,
                              itemCount: controller.results.length,
                              contentsBuilder: (context, index) {
                                Map<String, dynamic>? kpi =
                                    controller.results.elementAt(index);
                                // snapshot.data?.docs.elementAt(index).data();
                                log(name: "History", kpi.toString());
                                return CardHistoryTimeline(
                                  tanggal: DateFormat('d MMM yyyy')
                                      .format(kpi?['updatedAt'].toDate()),
                                  status: kpi?['status'][0],
                                  nama: kpi?['nama'],
                                  jabatan: kpi?['jabatan'],
                                  unitKerja: kpi?['unitKerja'],
                                  periode: kpi?['periode'],
                                );
                              })));
                    default:
                      break;
                  }
                }
                return const Text("No Data");
                // return const Text("No data");
              }),
        )
      ]),
    )));
  }
}
