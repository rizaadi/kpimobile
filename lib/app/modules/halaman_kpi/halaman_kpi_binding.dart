import 'package:get/get.dart';

import 'halaman_kpi_controller.dart';

class HalamanKpiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanKpiController>(
      HalamanKpiController.new,
    );
  }
}
