import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/register/register_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back()}
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
                height: 385,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        Text(
                          'register'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GetBuilder<RegisterController>(
                          init: registerController,
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
                                  'assets/icons/icon-phone.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                TextField(
                                  controller: controller.phone,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 35),
                                    border: InputBorder.none,
                                    hintText: 'login_your_phone'.tr,
                                    hintStyle: TextStyle(
                                      color: const Color(0xffD0D0D0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], //
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<RegisterController>(
                          init: registerController,
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
                                  controller: controller.password,
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
                                    hintText: 'login_your_password'.tr,
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
                          height: 30,
                        ),
                        GetBuilder<RegisterController>(
                          init: registerController,
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
                                  'assets/icons/icon-email.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                TextFormField(
                                  controller: controller.email,
                                  validator: (value) =>
                                      EmailValidator.validate(value!)
                                          ? null
                                          : "please_enter_a_valid_email".tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 35),
                                    border: InputBorder.none,
                                    hintText: 'register_your_email'.tr,
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
                          height: 60,
                        ),
                        GetBuilder<RegisterController>(
                          init: registerController,
                          builder: (controller) => SizedBox(
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () {
                                if (controller.phone.text.isEmpty ||
                                    controller.password.text.isEmpty ||
                                    controller.email.text.isEmpty) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'phone_password_email_empty'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                if (controller.phone.text.length != 10) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'enter_diff_ten_phone'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                if (controller.password.text.length < 5) {
                                  Get.snackbar(
                                    'validation'.tr,
                                    'enter_than_five_password'.tr,
                                    colorText: Colors.black,
                                    backgroundColor: Colors.white,
                                  );
                                  return;
                                }
                                controller.register(
                                    controller.phone.text,
                                    controller.password.text,
                                    controller.email.text);
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
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/icons/icon-right-button.png',
                      width: 25,
                      height: 25,
                      color: Colors.black,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
