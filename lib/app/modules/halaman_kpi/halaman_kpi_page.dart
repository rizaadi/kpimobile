import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'halaman_kpi_controller.dart';

class HalamanKpiPage extends GetView<HalamanKpiController> {
  const HalamanKpiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HalamanKpiPage'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            const TextField(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Wrap(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Filter"),
                    icon: SvgPicture.asset('assets/icons/sliders.svg'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Riwayat'),
                    icon: SvgPicture.asset('assets/icons/history.svg'),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Tambah KPI'),
                icon: SvgPicture.asset('assets/icons/plus.svg'),
              ),
            ])
          ]),
        ));
  }
}
