import 'package:get/get.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static const authLogin = '/auth/login';

  static final routes = [
    GetPage(
      name: authLogin,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
  ];
}
