import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/otp/otp_controller.dart';
import 'package:shoes_shop_app/pages/auth/reset-password/reset_password_page.dart';

class OtpPage extends GetView<OtpControler> {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            'otp'.tr,
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
              height: 50.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  'otp_enter'.tr,
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
              height: 60.0,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                autoFocus: true,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                useExternalAutoFillGroup: true,
                cursorColor: Colors.white,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  selectedColor: Colors.black,
                ),
                keyboardType: TextInputType.number,
                textStyle: TextStyle(
                  color: Get.theme.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                onCompleted: (code) {
                  // AuthService.to.inputCode.value = code;
                  // AuthService.to.verifyOtp(phone);
                  Get.to(const ResetPasswordPage());
                },
                onChanged: (value) {},
                hintCharacter: '*',
                beforeTextPaste: (text) {
                  return true;
                },
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'otp_expires'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  '01:00',
                  style: GoogleFonts.ebGaramond(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 110),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.refresh,
                        size: 20,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'otp_resend'.tr,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
