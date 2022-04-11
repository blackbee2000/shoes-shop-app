import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_controller.dart';
import 'package:shoes_shop_app/pages/auth/register/register_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());
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
                      const Text(
                        'Sign In',
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
                                'assets/icons/icon-user.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                              TextField(
                                controller: controller.phone,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'Your name',
                                  hintStyle: TextStyle(
                                    color: Color(0xffD0D0D0),
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
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'Your password',
                                  hintStyle: TextStyle(
                                    color: Color(0xffD0D0D0),
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
                                Get.to(const RegisterPage());
                              },
                              child: const Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // if (loginController.phone.text.isEmpty &&
                            //     loginController.password.text.isEmpty) {
                            //   Get.snackbar(
                            //     'Validation',
                            //     'Phone, password is empty',
                            //     colorText: Colors.black,
                            //     backgroundColor: Colors.white,
                            //   );
                            // }
                            // else {
                            //   AuthService.to.login(controller.phone.text,
                            //       controller.password.text);
                            //   Get.offAll(DashboardPage());
                            // }
                            Get.to(DashboardPage());
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
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Login with google',
                            style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }
}
