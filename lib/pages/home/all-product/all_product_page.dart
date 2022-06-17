import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/home/all-product/all_product_controller.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({
    Key? key,
  }) : super(key: key);

  @override
  AllProductState createState() => AllProductState();
}

class AllProductState extends State<AllProductPage> {
  final allProductController = Get.put(AllProductController());
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.back(id: AppConstant.HOME);
    return true;
  }

  Widget loginPopup(BuildContext context) {
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
                      'notification'.tr,
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
            Align(
              alignment: Alignment.center,
              child: Text(
                'login_popup'.tr,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
                      onTap: () => Navigator.pop(context),
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
                        Get.to(const LoginPage());
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
    return GestureDetector(
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
                title: Text(
                  "product_title".tr,
                  style: GoogleFonts.ebGaramond(
                    color: theme.theme == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: false,
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
              body: GetBuilder<AllProductController>(
                init: allProductController,
                builder: (controller) => RefreshIndicator(
                  onRefresh: () async {
                    controller.update();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: controller.listProduct.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.55,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: controller.listProduct.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          ProductDetailPage(
                                            product:
                                                controller.listProduct[index],
                                            id: AppConstant.HOME,
                                          ),
                                          id: AppConstant.HOME);
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (ApiToken
                                                        .to.isTokenExisted) {
                                                      if (controller
                                                              .listProduct[
                                                                  index]
                                                              .isLike ==
                                                          false) {
                                                        controller.likeProduct(
                                                            controller
                                                                    .listProduct[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                            false);
                                                      } else {
                                                        controller.likeProduct(
                                                            controller
                                                                    .listProduct[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                            true);
                                                      }
                                                      controller.update();
                                                    } else {
                                                      Get.bottomSheet(
                                                          loginPopup(context));
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 36,
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 41,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.white
                                                            : Colors.black,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: controller
                                                                    .listProduct[
                                                                        index]
                                                                    .isLike ==
                                                                true
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color: theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                                size: 20,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                                size: 20,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Center(
                                                    child: CachedNetworkImage(
                                                      width: 90,
                                                      fit: BoxFit.contain,
                                                      imageUrl: controller
                                                          .listProduct[index]
                                                          .imageProduct!,
                                                      useOldImageOnUrlChange:
                                                          false,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              SizedBox(
                                                        height: 15,
                                                        width: 15,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress,
                                                            valueColor:
                                                                const AlwaysStoppedAnimation(
                                                                    Colors
                                                                        .white),
                                                            strokeWidth: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          ClipOval(
                                                        child: Container(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 36,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    width: 41,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "assets/icons/icon-cart.png",
                                                        width: 20,
                                                        height: 20,
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${AppTranslation.instance.language == AppTranslation.english ? (controller.listProduct[index].nameProductEn != null && controller.listProduct[index].nameProductEn!.isNotEmpty ? controller.listProduct[index].nameProductEn : '--') : (controller.listProduct[index].nameProductVi != null && controller.listProduct[index].nameProductVi!.isNotEmpty ? controller.listProduct[index].nameProductVi : '--')}',
                                              style: GoogleFonts.ebGaramond(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      CurrencyTextInputFormatter(
                                                    locale: AppTranslation
                                                                .instance
                                                                .language ==
                                                            AppTranslation
                                                                .english
                                                        ? "vi_VN"
                                                        : "en_US",
                                                    decimalDigits: 0,
                                                    symbol: "",
                                                  ).format((controller
                                                              .listProduct[
                                                                  index]
                                                              .price)
                                                          .toString()),
                                                  style: GoogleFonts.ebGaramond(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: controller
                                                                .listProduct[
                                                                    index]
                                                                .discount !=
                                                            0
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                  ),
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      ' - ${controller.listProduct[index].discount} %',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.amber,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    CurrencyTextInputFormatter(
                                                  locale: AppTranslation
                                                              .instance
                                                              .language ==
                                                          AppTranslation.english
                                                      ? "vi_VN"
                                                      : "en_US",
                                                  decimalDigits: 0,
                                                  symbol: "",
                                                ).format(((controller
                                                                    .listProduct[
                                                                        index]
                                                                    .price! *
                                                                (100 -
                                                                    controller
                                                                        .listProduct[
                                                                            index]
                                                                        .discount!) /
                                                                100) /
                                                            10)
                                                        .toString()),
                                                style: GoogleFonts.ebGaramond(
                                                  color: theme.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: RatingBarIndicator(
                                              rating: double.tryParse(controller
                                                      .listProduct[index].rating
                                                      .toString()) ??
                                                  0.0,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/icon-box.png',
                                        width: 45,
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'no_information'.tr,
                                        style: GoogleFonts.ebGaramond(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
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