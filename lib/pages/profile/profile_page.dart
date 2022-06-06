import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/change-password/change_password_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/pages/user/user_page.dart';
import 'package:shoes_shop_app/pages/your-order/your_order_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/app_theme.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends GetView<ProfileController> {
  final profileController = Get.put(ProfileController());

  ProfilePage({Key? key}) : super(key: key);

  Widget selectedLanguage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              profileController.language.value = AppTranslation.english;
              AppTranslation.instance
                  .updateLanguage(profileController.language.value);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'profile_english'.tr,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.05),
          ),
          GestureDetector(
            onTap: () {
              profileController.language.value = AppTranslation.vietnamese;
              AppTranslation.instance
                  .updateLanguage(profileController.language.value);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'profile_vietnames'.tr,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.PROFILE),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: GetBuilder<ThemeController>(
            builder: (theme) => Container(
              width: double.infinity,
              height: double.infinity,
              color:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: theme.theme == ThemeMode.light
                      ? Colors.white
                      : Colors.black,
                  title: Text(
                    'profile_title'.tr,
                    style: GoogleFonts.ebGaramond(
                      color: theme.theme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          CartPage(id: AppConstant.PROFILE),
                          id: AppConstant.PROFILE,
                        );
                      },
                      child: Image.asset(
                        "assets/icons/icon_cart.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: GestureDetector(
                        child: Image.asset(
                          "assets/icons/icon_message.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ApiToken().isTokenExisted
                                  ? ClipOval(
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          border: Border.all(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              width: 2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: ClipOval(
                                            child: Container(
                                              width: 135,
                                              height: 135,
                                              decoration: BoxDecoration(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    width: 2),
                                                shape: BoxShape.circle,
                                              ),
                                              child: controller.profile.value
                                                          .avatar !=
                                                      null
                                                  ? CachedNetworkImage(
                                                      imageUrl: controller
                                                          .profile
                                                          .value
                                                          .avatar!,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        color: Colors.white,
                                                        strokeWidth: 0.5,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : const Image(
                                                      image: AssetImage(
                                                        'assets/images/avatar.jpg',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              ApiToken().isTokenExisted
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: const Offset(0,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'profile_information'.tr,
                                                style: GoogleFonts.ebGaramond(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    UserPage(
                                                      id: AppConstant.PROFILE,
                                                      idProfile: controller
                                                          .profile.value.id!,
                                                    ),
                                                    id: AppConstant.PROFILE,
                                                  );
                                                },
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'profile_edit'.tr,
                                                      style: GoogleFonts
                                                          .ebGaramond(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image.asset(
                                                      "assets/icons/icon-edit.png",
                                                      width: 20,
                                                      height: 20,
                                                      fit: BoxFit.contain,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color:
                                                Colors.black.withOpacity(0.05),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Obx(
                                            () => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/icon-user.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${controller.profile.value.fullName != null && controller.profile.value.fullName!.isNotEmpty ? controller.profile.value.fullName : 'no_information'.tr}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Obx(
                                            () => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/icon-phone.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${controller.profile.value.phoneNumber != null && controller.profile.value.phoneNumber!.isNotEmpty ? controller.profile.value.phoneNumber : 'no_information'.tr}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Obx(
                                            () => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/icon-email.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${controller.profile.value.email != null && controller.profile.value.email!.isNotEmpty ? controller.profile.value.email : 'no_information'.tr}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'profile_language'.tr,
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(selectedLanguage());
                                      },
                                      child: Row(
                                        children: [
                                          Obx(
                                            () => Text(
                                              profileController
                                                          .language.value ==
                                                      const Locale('en', 'US')
                                                  ? 'profile_english'.tr
                                                  : 'profile_vietnames'.tr,
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.expand_more,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'profile_dark_theme'.tr,
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Obx(
                                      () => FlutterSwitch(
                                        width: 45,
                                        height: 25,
                                        value: profileController.theme.value ==
                                            ThemeMode.dark,
                                        activeColor: Colors.black,
                                        onToggle: (val) {
                                          AppTheme.instance.switchTheme();
                                          profileController.theme.value =
                                              AppTheme.instance.theme;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ApiToken().isTokenExisted
                                  ? GetBuilder<ProfileController>(
                                      init: profileController,
                                      builder: (controller) => GestureDetector(
                                        onTap: () {
                                          Get.to(ChangePasswordPage(),
                                              id: AppConstant.PROFILE);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          decoration: BoxDecoration(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'change_password'
                                                  .tr
                                                  .toUpperCase(),
                                              style: GoogleFonts.ebGaramond(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              ApiToken().isTokenExisted
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(ProductFavoritePage(),
                                                    id: AppConstant.PROFILE);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'profile_favorite'
                                                        .tr
                                                        .toUpperCase(),
                                                    style:
                                                        GoogleFonts.ebGaramond(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(const YourOrderPage(),
                                                    id: AppConstant.PROFILE);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'profile_your_order'
                                                        .tr
                                                        .toUpperCase(),
                                                    style:
                                                        GoogleFonts.ebGaramond(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(
                                height: 20,
                              ),
                              GetBuilder<ProfileController>(
                                init: profileController,
                                builder: (controller) => GestureDetector(
                                  onTap: () {
                                    profileController.logOut();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ApiToken().isTokenExisted
                                            ? 'profile_logout'.tr.toUpperCase()
                                            : 'sign_in'.tr.toUpperCase(),
                                        style: GoogleFonts.ebGaramond(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
