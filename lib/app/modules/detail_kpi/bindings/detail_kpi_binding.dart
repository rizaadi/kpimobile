import 'package:get/get.dart';

import '../controllers/detail_kpi_controller.dart';

class DetailKpiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKpiController>(
      () => DetailKpiController(),
    );
  }
}
