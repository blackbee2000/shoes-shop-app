import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/user/user_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  changePassword(
      String oldPassword, String newPassword, String confirmPassword) {
    print('PROFILE =>>>>>>> ${DateTime.now().toUtc().toString()}');
    UserProvider().updateProfile(
      params: {"oldPassword": oldPassword, "newPassword": newPassword},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
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
        update();
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Lỗi cập nhật thông tin',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        print('UPDATE PROFILE FAIL =>>> ${e.toString()}');
        update();
      },
    );
  }
}
