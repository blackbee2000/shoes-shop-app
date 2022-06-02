import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/models/otp.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/auth/otp/otp_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/user/user_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController numberPhone = TextEditingController();
  final storage = GetStorage();
  final otpResponse = Otp.fromJson({}).obs;

  setToken(token) async {
    await storage.write('token', token);
  }

  login(String phone, String password, String type) {
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
        if (type == 'login') {
          Get.offAll(const DashboardPage());
        } else if (type == 'register') {
          Get.to(
            UserPage(
              id: 1,
            ),
          );
        }
        update();
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Lỗi đăng nhập',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        // Get.back();
        print('LOGIN FAIL =>>> ${e.toString()}');
        update();
      },
    );
  }

  sendOtp(String phoneNumber) {
    AuthProvider().sendOtp(
      params: {"phoneNumber": phoneNumber},
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
        print('SEND OTP SUCESSS =>>>>>> ${res.toString()}');
        otpResponse.value = res.body!;
        Get.to(OtpPage());
        update();
      },
      onError: (e) {
        print('SEND OTP FAIL =>>>>>> ${e.toString()}');
        Get.back();
        update();
      },
    );
  }
}
