import 'package:get/get.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_page.dart';
import '../modules/auth/signup/signup_binding.dart';
import '../modules/auth/signup/signup_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static const authLogin = '/auth/login';
  static const authSignup = '/auth/signup';

  static final routes = [
    GetPage(
      name: authLogin,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: authSignup,
      page: SignupPage.new,
      binding: SignupBinding(),
    ),
  ];
}
