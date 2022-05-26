import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/blog/blog_page.dart';
import 'package:shoes_shop_app/pages/home/home_page.dart';
import 'package:shoes_shop_app/pages/product/product_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_page.dart';
import 'package:shoes_shop_app/pages/search/search_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<DashboardPage> {
  final controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildTitle() {
    return GetBuilder<ThemeController>(
      builder: (themeController) => Obx(
        () => Stack(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: themeController.theme == ThemeMode.light
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    : BorderRadius.circular(0),
                boxShadow: [
                  themeController.theme == ThemeMode.light
                      ? const BoxShadow(
                          color: Color(0xffBBBBBB),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        )
                      : const BoxShadow(),
                ],
              ),
              child: CustomNavigationBar(
                iconSize: 25,
                selectedColor: const Color(0xff040307),
                strokeColor: const Color(0x30040307),
                opacity: 1,
                elevation: 0,
                backgroundColor: Colors.transparent,
                items: [
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/icon_tab_home.png',
                      width: 25,
                      height: 25,
                      color: controller.tabIndex.value == 0
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/icon_tab_shoes.png',
                      width: 24,
                      height: 24,
                      color: controller.tabIndex.value == 1
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/icon_tab_search.png',
                      width: 24,
                      height: 24,
                      color: controller.tabIndex.value == 2
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/icon_tab_blog.png',
                      width: 24,
                      height: 24,
                      color: controller.tabIndex.value == 3
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/icon_tab_profile.png',
                      width: 24,
                      height: 24,
                      color: controller.tabIndex.value == 4
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                ],
                currentIndex: controller.tabIndex.value,
                onTap: (index) {
                  if (index == 0) {
                    while (Get.nestedKey(AppConstant.HOME)!
                            .currentState
                            ?.canPop() ==
                        true) {
                      Get.nestedKey(AppConstant.HOME)?.currentState?.pop();
                    }
                  } else if (index == 1) {
                    while (Get.nestedKey(AppConstant.PRODUCT)!
                            .currentState
                            ?.canPop() ==
                        true) {
                      Get.nestedKey(AppConstant.PRODUCT)?.currentState?.pop();
                    }
                  } else if (index == 2) {
                    while (Get.nestedKey(AppConstant.SEARCH)!
                            .currentState
                            ?.canPop() ==
                        true) {
                      Get.nestedKey(AppConstant.SEARCH)?.currentState?.pop();
                    }
                  } else if (index == 3) {
                    while (Get.nestedKey(AppConstant.BLOG)!
                            .currentState
                            ?.canPop() ==
                        true) {
                      Get.nestedKey(AppConstant.BLOG)?.currentState?.pop();
                    }
                  } else if (index == 4) {
                    while (Get.nestedKey(AppConstant.PROFILE)!
                            .currentState
                            ?.canPop() ==
                        true) {
                      Get.nestedKey(AppConstant.PROFILE)?.currentState?.pop();
                    }
                  }
                  controller.tabIndex.value = index;
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Visibility(
                      visible: controller.tabIndex.value == 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.black,
                        ),
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.bottomCenter,
                        height: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: controller.tabIndex.value == 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.topCenter,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: controller.tabIndex.value == 2,
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.topCenter,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: controller.tabIndex.value == 3,
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.bottomCenter,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: controller.tabIndex.value == 4,
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.bottomCenter,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.black,
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomePage(),
              ProductPage(),
              SearchPage(),
              BlogPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: _buildTitle(),
      ),
    );
  }
}
