import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/reset-password/reser_password_controller.dart';

class ResetPasswordPage extends StatelessWidget {
  String phone;
  ResetPasswordPage({Key? key, required this.phone}) : super(key: key);

  final resetPasswordController = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back()}
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: Text(
              'reset_password'.tr,
              style: GoogleFonts.ebGaramond(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    'enter_new_password_please'.tr,
                    style: GoogleFonts.ebGaramond(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GetBuilder<ResetPasswordController>(
                init: resetPasswordController,
                builder: (controller) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: controller.password,
                    style: GoogleFonts.ebGaramond(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      hintText: 'login_your_password'.tr,
                      hintStyle: GoogleFonts.ebGaramond(
                        color: const Color(0xffD0D0D0),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              GetBuilder<ResetPasswordController>(
                init: resetPasswordController,
                builder: (controller) => Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.password.text.length < 5) {
                        Get.snackbar(
                          'validation'.tr,
                          'enter_than_five_password'.tr,
                          colorText: Colors.black,
                          backgroundColor: Colors.white,
                        );
                        return;
                      }
                      controller.resetPassword(phone, controller.password.text);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'cofirm_change'.tr.toUpperCase(),
                          style: GoogleFonts.ebGaramond(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
