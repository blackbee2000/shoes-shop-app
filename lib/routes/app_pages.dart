import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_binding.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SpalshPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBORAD,
      page: () => DashboardPage(),
    ),
  ];
}
