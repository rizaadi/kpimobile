import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../../../core/theme/theme_config.dart';
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
          onPressed: () {},
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
                  contentsBuilder: (context, index) => CardHistory(
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

class CardHistory extends StatelessWidget {
  const CardHistory({
    Key? key,
    required this.nama,
    required this.jabatan,
    required this.unitKerja,
    required this.lampiran,
    required this.tanggal,
    required this.status,
  }) : super(key: key);

  final String tanggal;
  final String status;
  final String nama;
  final String jabatan;
  final String unitKerja;
  final String lampiran;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    color: Colors.black,
                    height: 12,
                    width: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    tanggal,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: ThemeConfig.colors.Gray_primary,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  status,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
              )
            ],
          ),
          const Divider(thickness: 1),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeConfig.colors.Gray_primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(nama, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(jabatan, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeConfig.colors.Gray_primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(unitKerja, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Text(lampiran, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ]),
      ),
    );
  }
}
