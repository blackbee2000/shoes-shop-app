import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/auth/reset-password/reset_password_page.dart';

class OtpController extends GetxController {
  submitOtp(String phone, int otp) {
    AuthProvider().submitOtp(
      params: {
        "phoneNumber": phone,
        "otp": otp,
        "time": DateTime.now().toUtc().toString()
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
        Get.to(
          ResetPasswordPage(
            phone: phone,
          ),
        );
      },
      onError: (e) {
        print('ĐÂY LÀ LỖI NÈ :)))) ${e.toString()}');
        Get.back();
      },
    );
  }
}
