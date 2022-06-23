import 'package:get/get.dart';

import 'package:kpimobile/app/modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import 'package:kpimobile/app/modules/bottom_navigation/views/bottom_navigation_view.dart';
import 'package:kpimobile/app/modules/detail_kpi/bindings/detail_kpi_binding.dart';
import 'package:kpimobile/app/modules/detail_kpi/views/detail_kpi_view.dart';
import 'package:kpimobile/app/modules/history/bindings/history_binding.dart';
import 'package:kpimobile/app/modules/history/views/history_view.dart';
import 'package:kpimobile/app/modules/home/home_binding.dart';
import 'package:kpimobile/app/modules/home/home_page.dart';
import 'package:kpimobile/app/modules/notifications/bindings/notifications_binding.dart';
import 'package:kpimobile/app/modules/notifications/views/notifications_view.dart';
import 'package:kpimobile/app/modules/profile/bindings/profile_binding.dart';
import 'package:kpimobile/app/modules/profile/views/profile_view.dart';
import 'package:kpimobile/app/modules/tambah_kpi/bindings/tambah_kpi_binding.dart';
import 'package:kpimobile/app/modules/tambah_kpi/views/tambah_kpi_view.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_page.dart';
import '../modules/auth/signup/signup_binding.dart';
import '../modules/auth/signup/signup_page.dart';
import '../modules/halaman_kpi/halaman_kpi_binding.dart';
import '../modules/halaman_kpi/halaman_kpi_page.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.AUTHLOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTHSIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HALAMANKPI,
      page: () => HalamanKpiPage(),
      binding: HalamanKpiBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KPI,
      page: () => DetailKpiView(),
      binding: DetailKpiBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KPI,
      page: () => TambahKpiView(),
      binding: TambahKpiBinding(),
    ),
  ];
}
