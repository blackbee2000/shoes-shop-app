import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final storage = GetStorage();
  final profileController = Get.put(ProfileController());

  setToken(token) async {
    await storage.write('token', token);
  }

  login(String phone, String password) {
    AuthProvider().login(
      params: {"phoneNumber": phone, "password": password},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {
        Get.dialog(
          const SizedBox(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          barrierDismissible: false,
        );
      },
      onSuccess: (res) {
        print('LOGIN SUCESSS =>>>>>> ${res.toString()}');
        setToken(res.data?.token);
        print('TOKEN NEFFFFFFF =>>>>>> ${ApiToken.to.appToken}');
        profileController.getProfile();
        Get.offAll(DashboardPage());
        update();
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Lỗi đăng nhập',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        print('LOGIN FAIL =>>> ${e.toString()}');
        update();
      },
    );
  }
}
