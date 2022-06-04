import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoes_shop_app/models/profile.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/app_theme.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';

class ProfileController extends GetxController {
  final tabIndex = 0.obs;
  final indexSelected = 0.obs;
  final theme = AppTheme.instance.theme.obs;
  final language = AppTranslation.instance.language.obs;
  final storage = GetStorage();
  final profile = Profile.fromJson({}).obs;
  String imageSelected = "";

  @override
  void onInit() async {
    super.onInit();
    getProfile();
    defaultValue();
  }

  void defaultValue() {
    imageSelected = "";
    update();
  }

  removeToken() async {
    await storage.remove('token');
  }

  logOut() async {
    profile.value = Profile.fromJson({});
    update();
    await removeToken();
    Get.to(const LoginPage());
  }

  getProfile() {
    ProfileProvider().getProfile(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET INFO PROFILE SUCESS =>>>>>>> ${res.toString()}');
        profile.value = res.data!;
        update();
        print(
            'GET INFO PROFILE SUCESS HAHAAHAAA =>>>>>>> ${profile.toString()}');
      },
      onError: (e) {
        print('GET INFO PROFILE FAIL =>>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
