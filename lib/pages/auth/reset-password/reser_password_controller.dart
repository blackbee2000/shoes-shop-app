import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  resetPassword(String phone, String password) {
    AuthProvider().resetPassword(
      params: {"phoneNumber": phone, "confirmPassword": password},
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
        Get.offAll(const DashboardPage());
      },
      onError: (e) {
        print('ĐÂY LÀ LỖI NÈ :)))) ${e.toString()}');
        Get.back();
      },
    );
  }
}
