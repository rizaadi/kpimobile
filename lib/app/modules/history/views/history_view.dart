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
                    children: const [
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
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
                return Timeline.tileBuilder(
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
                        indicatorStyleBuilder: (context, index) =>
                            IndicatorStyle.dot,
                        itemCount: snapshot.data?.docs.length ?? 0,
                        contentsBuilder: (context, index) {
                          Map<String, dynamic>? kpi =
                              snapshot.data?.docs.elementAt(index).data();
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
                        }));
              }),
        )
      ]),
    )));
  }
}
