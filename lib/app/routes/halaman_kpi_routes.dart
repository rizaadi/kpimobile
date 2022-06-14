import 'package:get/get.dart';

import '../modules/halaman_kpi/halaman_kpi_binding.dart';
import '../modules/halaman_kpi/halaman_kpi_page.dart';

class HalamanKpiRoutes {
  HalamanKpiRoutes._();

  static const halamanKpi = '/halaman-kpi';

  static final routes = [
    GetPage(
      name: halamanKpi,
      page: HalamanKpiPage.new,
      binding: HalamanKpiBinding(),
    ),
  ];
}
