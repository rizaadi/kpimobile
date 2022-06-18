import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_kpi_controller.dart';

class DetailKpiView extends GetView<DetailKpiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailKpiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailKpiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
