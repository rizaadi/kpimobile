import 'package:get/get.dart';

import '../controllers/edit_kpi_controller.dart';

class EditKpiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKpiController>(
      () => EditKpiController(),
    );
  }
}
