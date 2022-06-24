import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/change-password/change_password_controller.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePasswordPage> {
  final changePasswordController = Get.put(ChangePasswordController());
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.back(id: AppConstant.PROFILE);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: AppConstant.PROFILE)}
      },
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/background_singin.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Get.back(id: AppConstant.PROFILE);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'change_password'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                ),
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<ChangePasswordController>(
                          init: changePasswordController,
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Image.asset(
                                  'assets/icons/icon-lock.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                TextField(
                                  controller: controller.oldPassword,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 35),
                                    border: InputBorder.none,
                                    hintText: 'user_old_password'.tr,
                                    hintStyle: TextStyle(
                                      color: const Color(0xffD0D0D0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<ChangePasswordController>(
                          init: changePasswordController,
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Image.asset(
                                  'assets/icons/icon-lock.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                TextField(
                                  controller: controller.newPassword,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 35),
                                    border: InputBorder.none,
                                    hintText: 'user_new_password'.tr,
                                    hintStyle: TextStyle(
                                      color: const Color(0xffD0D0D0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<ChangePasswordController>(
                          init: changePasswordController,
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Image.asset(
                                  'assets/icons/icon-lock.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                TextField(
                                  controller: controller.confirmPassword,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 35),
                                    border: InputBorder.none,
                                    hintText: 'confirm_password'.tr,
                                    hintStyle: TextStyle(
                                      color: const Color(0xffD0D0D0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GetBuilder<ChangePasswordController>(
                          init: changePasswordController,
                          builder: (controller) => SizedBox(
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () {
                                if (controller.oldPassword.text.isEmpty ||
                                    controller.newPassword.text.isEmpty ||
                                    controller.confirmPassword.text.isEmpty) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'old_new_confirm_password_is_empty'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                if (controller.oldPassword.text.length < 5) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'enter_than_five_password_old'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                if (controller.newPassword.text.length < 5) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'enter_than_five_password_new'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }

                                if (controller.newPassword.text !=
                                    controller.confirmPassword.text) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'match_password'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                controller.changePassword(
                                    controller.oldPassword.text,
                                    controller.newPassword.text,
                                    controller.confirmPassword.text);
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/icons/icon-right-button.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
