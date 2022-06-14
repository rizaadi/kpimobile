import 'home_routes.dart';
import 'auth_routes.dart';
import 'halaman_kpi_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/halaman-kpi';

  static final routes = [
    ...HomeRoutes.routes,
    ...AuthRoutes.routes,
    ...HalamanKpiRoutes.routes,
  ];
}
