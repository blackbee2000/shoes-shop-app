import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.put(AuthService());

  final storage = GetStorage();

// Read token
  String? get appToken => storage.read('app_token');

  bool get isTokenExisted => appToken?.isNotEmpty == true;

  setToken(String token) async {
    await storage.write('app_token', token);
  }

  revokeToken() async {
    await storage.write('app_token', '');
  }

  login(String phone, String password) {
    AuthProvider().login(
        params: {"phoneNumber": phone, "password": password},
        beforeSend: () {},
        onSuccess: (data) {
          print('token1 ${data.data!.token!}');
          setToken(data.data!.token!);
          if (Get.isDialogOpen == true) {
            Get.back();
          }
          Get.offAll(DashboardPage());
        },
        onError: (onError) {
          if (Get.isDialogOpen == true) {
            Get.back();
          }
          print('onError $onError');
        });
  }
}
