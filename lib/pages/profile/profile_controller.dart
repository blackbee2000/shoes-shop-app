import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/models/profile.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/pages/user/user_page.dart';
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
    getProfile('profile');
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

  getProfile(String type) {
    ProfileProvider().getProfile(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        profile.value = res.data!;
        if (type == 'register') {
          Future.delayed(const Duration(milliseconds: 500)).then((_) {
            Get.to(
              UserPage(
                id: 1,
                idProfile: profile.value.id ?? '',
              ),
            );
          });
        }
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
