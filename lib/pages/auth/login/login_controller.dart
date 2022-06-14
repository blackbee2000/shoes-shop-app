import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/pages/auth/auth_provider.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_controller.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/pages/user/user_controller.dart';
import 'package:shoes_shop_app/pages/user/user_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';

import '../../profile/profile_controller.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController numberPhone = TextEditingController();
  final profileController = Get.put(ProfileController());
  final storage = GetStorage();
  final phoneForOtp = ''.obs;
  final userController = Get.put(UserController());
  final dashboardController = Get.put(DashboardController());

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
        setToken(res.data?.token);
        if (type == 'login') {
          dashboardController.onInit();
          dashboardController.update();
          Get.offAll(const DashboardPage());
        } else if (type == 'register') {
          profileController.onInit();
          Future.delayed(const Duration(milliseconds: 500)).then((_) {
            Get.to(
              UserPage(
                id: 1,
                idProfile: profileController.profile.value.id ?? '',
              ),
            );
          });
        }
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'login_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }
}
