import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/user/user_page.dart';

class RegisterController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  register(String phone, String password, String email) {
    AuthProvider().register(
      params: {
        "fullName": null,
        "email": email,
        "phoneNumber": phone,
        "password": password,
        "role": "USER"
      },
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
        print('REGISTER SUCESS =>>>>> ${res.toString()}');
        Get.to(
          UserPage(
            id: 1,
          ),
        );
      },
      onError: (e) {
        print('REGISTER FAIL =>>>>> ${e.toString()}');
        Get.snackbar(
          'Fail',
          'Lỗi đăng ký',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
