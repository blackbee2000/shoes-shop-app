import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/auth/login/login_controller.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';

class RegisterController extends GetxController {
  final loginController = Get.put(LoginController());
  final profileController = Get.put(ProfileController());
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
        loginController.login(phone, password, 'register');
      },
      onError: (e) {
        print('REGISTER FAIL =>>>>> ${e.toString()}');
        Get.snackbar(
          'Fail',
          'Lỗi đăng ký',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        Get.back();
      },
    );
  }
}
