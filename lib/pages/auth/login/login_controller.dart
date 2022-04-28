import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

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
        Get.offAll(DashboardPage());
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Lỗi đăng nhập',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        print('LOGIN FAIL =>>> ${e.toString()}');
      },
    );
  }
}
