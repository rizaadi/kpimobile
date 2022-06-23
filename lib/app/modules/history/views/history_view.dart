import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/card_history_timeline.dart';
import 'package:timelines/timelines.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
          icon: SvgPicture.asset('assets/icons/sliders.svg'),
          label: const Text("Filter"),
          style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                  indicatorPosition: 0.1,
                  nodePosition: 0,
                  color: Get.theme.primaryColor,
                  indicatorTheme: const IndicatorThemeData(size: 14),
                  connectorTheme: const ConnectorThemeData(thickness: 2)),
              shrinkWrap: true,
              builder: TimelineTileBuilder.connectedFromStyle(
                  firstConnectorStyle: ConnectorStyle.transparent,
                  lastConnectorStyle: ConnectorStyle.transparent,
                  connectorStyleBuilder: (context, index) =>
                      ConnectorStyle.solidLine,
                  indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                  itemCount: 4,
                  contentsBuilder: (context, index) => CardHistoryTimeline(
                        tanggal: "15 Mei 2022",
                        status: "Draft",
                        nama: "Nendra Ariyanto",
                        jabatan: "VP Remunerisasi & Manj. Kinerja",
                        unitKerja: "Departement Remunerasi & Manj. Kinerja",
                        lampiran: "Terlampir draft..",
                      ))),
        )
      ]),
    )));
  }
}
