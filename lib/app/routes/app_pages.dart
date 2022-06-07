import 'home_routes.dart';
import 'auth_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
		...AuthRoutes.routes,
  ];
}
