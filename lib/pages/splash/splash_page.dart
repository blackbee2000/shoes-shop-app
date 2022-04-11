import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                fit: BoxFit.contain,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Wellcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hello there, nice to meet you!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/lifekicky.png",
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Future.delayed(const Duration(milliseconds: 500), () {
                      //   Get.dialog(
                      //     Lottie.asset(
                      //       'assets/loading/shoes_loading.json',
                      //       width: 100,
                      //       height: 100,
                      //       fit: BoxFit.fill,
                      //     ),
                      //     barrierDismissible: false,
                      //   );
                      // });
                      // Get.back();
                      Get.offAll(DashboardPage());
                    },
                    child: Container(
                      width: 180,
                      height: 85,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(300),
                          topRight: Radius.circular(300),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff727272),
                            Color(0xff000000),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
