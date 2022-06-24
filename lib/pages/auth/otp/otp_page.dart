import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_controller.dart';
import 'package:shoes_shop_app/pages/auth/otp/otp_controller.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';

class OtpPage extends GetView<OtpController> {
  OtpPage({Key? key}) : super(key: key);

  final otpController = Get.put(OtpController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back()}
      },
      child: SafeArea(
        child: GetBuilder<ThemeController>(
          builder: (theme) => Scaffold(
            backgroundColor:
                theme.theme == ThemeMode.light ? Colors.white : Colors.black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              bottom: theme.theme == ThemeMode.dark
                  ? PreferredSize(
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xffF01101),
                        height: 1,
                      ),
                      preferredSize: const Size.fromHeight(0),
                    )
                  : PreferredSize(
                      child: Container(),
                      preferredSize: const Size.fromHeight(0),
                    ),
              backgroundColor:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: theme.theme == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              centerTitle: true,
              title: Text(
                'otp'.tr,
                style: TextStyle(
                  color: theme.theme == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
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
                      style: TextStyle(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
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
                GetBuilder<OtpController>(
                  init: otpController,
                  builder: (controller) => Container(
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
                      cursorColor: theme.theme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        inactiveColor: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        activeColor: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        selectedColor: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textStyle: TextStyle(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      onCompleted: (code) {
                        controller.submitOtp(
                            loginController.phoneForOtp.value, int.parse(code));
                      },
                      onChanged: (value) {},
                      hintCharacter: '*',
                      hintStyle: TextStyle(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black.withOpacity(0.5)
                            : Colors.white.withOpacity(0.5),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                GetBuilder<OtpController>(
                  init: otpController,
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'otp_expires'.tr,
                        style: TextStyle(
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      TweenAnimationBuilder<Duration>(
                        duration: const Duration(minutes: 2),
                        tween: Tween(
                            begin: const Duration(minutes: 2),
                            end: Duration.zero),
                        onEnd: () {},
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '$minutes:$seconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                GetBuilder<OtpController>(
                  init: otpController,
                  builder: (controller) => GestureDetector(
                    onTap: () {
                      otpController.sendOtp(
                          loginController.phoneForOtp.value, 'otp');
                    },
                    child: Container(
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
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.white.withOpacity(0.5),
                              ),
                            ),
                            Text(
                              'otp_resend'.tr,
                              style: TextStyle(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.white.withOpacity(0.5),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
