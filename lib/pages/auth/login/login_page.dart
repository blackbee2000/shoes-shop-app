import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_controller.dart';
import 'package:shoes_shop_app/pages/auth/otp/otp_controller.dart';
import 'package:shoes_shop_app/pages/auth/otp/otp_page.dart';
import 'package:shoes_shop_app/pages/auth/register/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final loginController = Get.put(LoginController());
  final otpController = Get.put(OtpControler());

  Widget enterNumberPhone(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'enter_number_phone'.tr,
                      style: GoogleFonts.ebGaramond(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: loginController.numberPhone,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    bottom: 7,
                    left: 15,
                  ),
                  hintText: 'login_your_phone'.tr,
                  hintStyle: GoogleFonts.ebGaramond(
                    color: const Color(0xffD0D0D0),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'address_cancel'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                        if (loginController.numberPhone.text.isEmpty) {
                          Get.snackbar(
                            'Validation',
                            'Vui lòng nhập số điện thoại',
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                          );
                          return;
                        }

                        loginController
                            .sendOtp(loginController.numberPhone.text);
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            'address_confirm'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              backgroundColor: Colors.transparent,
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Text(
                        'sign_in'.tr,
                        style: GoogleFonts.ebGaramond(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GetBuilder<LoginController>(
                        init: loginController,
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
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'login_your_phone'.tr,
                                  hintStyle: GoogleFonts.ebGaramond(
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
                      GetBuilder<LoginController>(
                        init: loginController,
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
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'login_your_password'.tr,
                                  hintStyle: GoogleFonts.ebGaramond(
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(RegisterPage());
                              },
                              child: Text(
                                'login_not_account'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  enterNumberPhone(context),
                                  isScrollControlled: true,
                                );
                              },
                              child: Text(
                                'login_forget_password'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GetBuilder<LoginController>(
                        init: loginController,
                        builder: (controller) => Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              if (loginController.phone.text.isEmpty &&
                                  loginController.password.text.isEmpty) {
                                Get.snackbar(
                                  'Validation',
                                  'Phone, password is empty',
                                  colorText: Colors.black,
                                  backgroundColor: Colors.white,
                                );
                              } else {
                                controller.login(controller.phone.text,
                                    controller.password.text, 'login');
                              }
                            },
                            child: ClipOval(
                              child: Container(
                                width: 60,
                                height: 60,
                                color: Colors.black,
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/icon-right-button.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'login_with_google'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/icons/icon-google.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        width: 170,
                        height: 1,
                        color: Colors.black,
                      )
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
                  onTap: () => Get.offAll(const DashboardPage()),
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
    );
  }
}
