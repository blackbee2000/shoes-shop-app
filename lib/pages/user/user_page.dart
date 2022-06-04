import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/user/user_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/profile_controller.dart';

class UserPage extends StatefulWidget {
  final int id;
  final String idProfile;
  const UserPage({
    Key? key,
    required this.idProfile,
    required this.id,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userController = Get.put(UserController());
  final profileController = Get.put(ProfileController());

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
              userController.getImage(widget.idProfile);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'user_camera'.tr,
                style: GoogleFonts.ebGaramond(
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
              userController.getPhoto(widget.idProfile);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'user_galery'.tr,
                style: GoogleFonts.ebGaramond(
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
                leading: widget.id == AppConstant.PROFILE
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
                title: Text(
                  'user_update_information'.tr,
                  style: GoogleFonts.ebGaramond(
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
                                ? profileController.profile.value.avatar != null
                                    ? ClipOval(
                                        child: Container(
                                          width: 115,
                                          height: 115,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            border:
                                                Border.all(color: Colors.white),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: ClipOval(
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: profileController
                                                      .profile.value.avatar!,
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress,
                                                    color: Colors.white,
                                                    strokeWidth: 0.5,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
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
                                            border:
                                                Border.all(color: Colors.white),
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
                                          child: controller.isLoading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 0.5,
                                                ))
                                              : Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        controller.imageUser!,
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                      value: downloadProgress
                                                          .progress,
                                                      color: Colors.white,
                                                      strokeWidth: 0.5,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
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
                      GetBuilder<UserController>(
                        init: userController,
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
                                controller: controller.name,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'user_your_name'.tr,
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
                      GetBuilder<UserController>(
                        init: userController,
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
                        height: 20,
                      ),
                      GetBuilder<UserController>(
                        init: userController,
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
                              TextField(
                                controller: controller.email,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 35),
                                  border: InputBorder.none,
                                  hintText: 'register_your_email'.tr,
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
                                Get.to(
                                    AddressPage(
                                      id: widget.id,
                                    ),
                                    id: widget.id);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'cart_address'.tr,
                                    style: GoogleFonts.ebGaramond(
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
                                Get.offAll(const DashboardPage());
                              },
                              child: Text(
                                'user_skip'.tr,
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
                        height: 40,
                      ),
                      GetBuilder<UserController>(
                        init: userController,
                        builder: (controller) => SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              // Get.offAll(DashboardPage());
                              controller.updateProfile(
                                  controller.name.text,
                                  controller.phone.text,
                                  controller.email.text,
                                  controller.imageUser ?? "");
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
    );
  }
}
