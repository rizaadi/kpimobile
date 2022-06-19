import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'package:kpimobile/app/core/widgets/custom_textfield.dart';

import '../controllers/tambah_kpi_controller.dart';

class TambahKpiView extends GetView<TambahKpiController> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Tambah KPI",
              style: Get.textTheme.headline5,
            ),
            CustomTextField(),
            CustomTextField(),
            CustomTextField(),
            CustomTextField(),
          ]),
        )));
  }
}
