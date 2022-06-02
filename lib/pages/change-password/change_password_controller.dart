import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/change-password/change_password_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/pages/profile/profile_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final profileController = Get.put(ProfileController());

  @override
  void onInit() async {
    super.onInit();
  }

  changePassword(
      String oldPassword, String newPassword, String confirmPassword) {
    ChangePasswordProvider().changePassword(
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
        profileController.profile.value = res.data!;
        Get.snackbar(
          '',
          'Đổi mật khẩu thành công',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        // Future.delayed(const Duration(milliseconds: 500)).then((_) {
        //   Get.to(ProfilePage());
        // });
        update();
      },
      onError: (e) {
        Get.back();
        print('CHANGE PASSWORD FAIL =>>> ${e.toString()}');
        Get.back();
        update();
      },
    );
  }
}
