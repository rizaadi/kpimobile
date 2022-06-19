import 'package:get/get.dart';

import '../controllers/tambah_kpi_controller.dart';

class TambahKpiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKpiController>(
      () => TambahKpiController(),
    );
  }
}
