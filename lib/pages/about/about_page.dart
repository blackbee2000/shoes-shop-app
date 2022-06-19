import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_controller.dart';
import 'package:shoes_shop_app/pages/auth/register/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:shoes_shop_app/utils/utils.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: AppConstant.HOME)}
      },
      child: SafeArea(
        child: GetBuilder<ThemeController>(
          builder: (theme) => Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.theme == ThemeMode.light ? Colors.white : Colors.black,
            child: Scaffold(
              backgroundColor:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
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
                backgroundColor: theme.theme == ThemeMode.light
                    ? Colors.white
                    : Colors.black,
                leading: IconButton(
                  onPressed: () {
                    Get.back(id: AppConstant.HOME);
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
                  'about'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: theme.theme == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          const ProductFavoritePage(
                            id: AppConstant.HOME,
                          ),
                          id: AppConstant.HOME);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: theme.theme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          const CartPage(id: AppConstant.HOME),
                          id: AppConstant.HOME,
                        );
                      },
                      child: Image.asset(
                        "assets/icons/icon_cart.png",
                        width: 20,
                        height: 20,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'text_1'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-  Keira Knightley -',
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/lifekicky.png",
                        width: 150,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'who_we_are'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 2,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'text_2'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'contact_info'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 2,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/icon-address.png',
                            width: 20,
                            height: 20,
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              '${AppTranslation.instance.language == AppTranslation.english ? '101 Truong Chinh, Tan Thoi Nhat, 12 District, Ho Chi Minh City' : '101 Trường Chinh, Tân Thới Nhất, Quận 12, Thành Phố Hồ Chí Minh'}',
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchCall('0988224455');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/icon-phone.png',
                              width: 20,
                              height: 20,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Text(
                                '0988224455',
                                style: GoogleFonts.ebGaramond(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchMailTo(
                              'lifekicky101@gmail.com', 'LifeKicky Shoes');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/icon-email.png',
                              width: 20,
                              height: 20,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Text(
                                'lifekicky101@gmail.com',
                                style: GoogleFonts.ebGaramond(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchInWebViewOrVC(
                                Uri.parse(
                                    'https://www.facebook.com/linh.thai.35325'),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/facebook.png',
                              width: 40,
                              height: 40,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              launchInWebViewOrVC(
                                Uri.parse('https://www.instagram.com/lizh_49/'),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/instagram.png',
                              width: 40,
                              height: 40,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              launchInWebViewOrVC(
                                Uri.parse('https://twitter.com/?lang=vi'),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/twitter.png',
                              width: 40,
                              height: 40,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'member'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 2,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 170,
                              ),
                              height: 150,
                              decoration: BoxDecoration(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${AppTranslation.instance.language == AppTranslation.english ? 'Thái Duy Linh' : 'Thái Duy Linh'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '20/09/2000',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '0329011888',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Founder',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: 150,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              alignment: Alignment.bottomRight,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                right: 170,
                              ),
                              height: 150,
                              decoration: BoxDecoration(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${AppTranslation.instance.language == AppTranslation.english ? 'Tran Thai Tuan' : 'Trần Thái Tuấn'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '18/09/2000',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '0329011999',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Co-Founder',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 150,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        'assets/icons/Thankyou.png',
                        width: 150,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
