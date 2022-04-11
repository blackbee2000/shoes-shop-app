import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/user/user_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';

class UserPage extends StatelessWidget {
  final int id;
  UserPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final userController = Get.put(UserController());

  Widget selectedProvide() {
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
              userController.getImage();
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Camera',
                style: TextStyle(
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
              userController.getPhoto();
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Galery',
                style: TextStyle(
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
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_update_profile.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: id == AppConstant.PROFILE
                    ? IconButton(
                        onPressed: () {
                          Get.back(id: AppConstant.PROFILE);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                title: const Text(
                  'Update information',
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
                        height: 10,
                      ),
                      Stack(
                        children: [
                          GetBuilder<UserController>(
                            init: userController,
                            builder: (controller) => userController.imageUser ==
                                    null
                                ? ClipOval(
                                    child: Container(
                                      width: 115,
                                      height: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: ClipOval(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Colors.white),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : ClipOval(
                                    child: Container(
                                      width: 115,
                                      height: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: ClipOval(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              shape: BoxShape.circle,
                                              // F
                                            ),
                                            child: Image.file(
                                              userController.imageUser!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          Positioned(
                            top: 80,
                            right: 0,
                            child: ClipOval(
                              child: Container(
                                width: 35,
                                height: 35,
                                color: Colors.white,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        selectedProvide(),
                                        isScrollControlled: true,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                            const TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                            const TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                            const TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 35),
                                border: InputBorder.none,
                                hintText: 'Your phone',
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                            const TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 35),
                                border: InputBorder.none,
                                hintText: 'Your email',
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(AddressPage());
                              },
                              child: Row(
                                children: [
                                  const Text(
                                    'Address',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/icons/icon-address.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(DashboardPage());
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
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
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Get.offAll(DashboardPage());
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