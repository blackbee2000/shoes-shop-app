import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/product/product_controller.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends GetView<ProductController> {
  final productController = Get.put(ProductController());

  ProductPage({Key? key}) : super(key: key);

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
    return Navigator(
      key: Get.nestedKey(AppConstant.PRODUCT),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: GetBuilder<ThemeController>(
            builder: (theme) => Container(
              width: double.infinity,
              height: double.infinity,
              color:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/product_banner.jpg",
                    width: double.infinity,
                    height: 225,
                    fit: BoxFit.cover,
                  ),
                  Scaffold(
                    backgroundColor: theme.theme == ThemeMode.light
                        ? Colors.black.withOpacity(0)
                        : Colors.white.withOpacity(0),
                    appBar: AppBar(
                      backgroundColor: theme.theme == ThemeMode.light
                          ? Colors.black.withOpacity(0)
                          : Colors.white.withOpacity(0),
                      title: Text(
                        "product_title".tr,
                        style: GoogleFonts.ebGaramond(
                          color: Colors.white,
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
                                  id: AppConstant.PRODUCT,
                                ),
                                id: AppConstant.PRODUCT);
                          },
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                const CartPage(id: AppConstant.PRODUCT),
                                id: AppConstant.PRODUCT,
                              );
                            },
                            child: Image.asset(
                              "assets/icons/icon_cart.png",
                              width: 20,
                              height: 20,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10, right: 20),
                        //   child: GestureDetector(
                        //     child: Image.asset(
                        //       "assets/icons/icon_message.png",
                        //       width: 20,
                        //       height: 20,
                        //       color: theme.theme == ThemeMode.light
                        //           ? Colors.black
                        //           : Colors.white,
                        //       fit: BoxFit.contain,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    body: GetBuilder<ProductController>(
                      init: productController,
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
                                height: 140,
                              ),
                              Container(
                                width: double.infinity,
                                height: 80,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
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
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.listCompany.length,
                                  itemBuilder: (context, index) => SizedBox(
                                    width: 60,
                                    height: double.infinity,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.nameBrand.value = controller
                                            .listCompany[index].nameCompany!;
                                        if (ApiToken.to.isTokenExisted ==
                                            true) {
                                          controller.getListProductFavorite(
                                              controller
                                                      .listCompany[index].id ??
                                                  '');
                                        } else {
                                          controller.getAllProduct(
                                              controller.listCompany[index].id!,
                                              []);
                                        }
                                        controller.update();
                                      },
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipOval(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                color: Colors.black,
                                                child: CachedNetworkImage(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                  imageUrl: controller
                                                          .listCompany[index]
                                                          .logoCompany ??
                                                      '',
                                                  useOldImageOnUrlChange: false,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          SizedBox(
                                                    height: 15,
                                                    width: 15,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        valueColor:
                                                            const AlwaysStoppedAnimation(
                                                                Colors.white),
                                                        strokeWidth: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          ClipOval(
                                                    child: Container(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${controller.listCompany[index].nameCompany != null && controller.listCompany[index].nameCompany!.isNotEmpty ? controller.listCompany[index].nameCompany : '--'}',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${productController.nameBrand}',
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: controller.listProduct.isNotEmpty
                                    ? GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.52,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          crossAxisCount: 2,
                                        ),
                                        itemCount:
                                            controller.listProduct.length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                ProductDetailPage(
                                                  product: controller
                                                      .listProduct[index],
                                                  id: AppConstant.PRODUCT,
                                                ),
                                                id: AppConstant.PRODUCT);
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (ApiToken.to
                                                              .isTokenExisted) {
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
                                                                loginPopup(
                                                                    context));
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 36,
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Container(
                                                            width: 41,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: theme.theme ==
                                                                      ThemeMode
                                                                          .light
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
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
                                                                      Icons
                                                                          .favorite,
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
                                                        height: 15,
                                                      ),
                                                      Center(
                                                        child:
                                                            CachedNetworkImage(
                                                          width: 80,
                                                          fit: BoxFit.contain,
                                                          imageUrl: controller
                                                              .listProduct[
                                                                  index]
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
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 36,
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Container(
                                                          width: 41,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: theme.theme ==
                                                                    ThemeMode
                                                                        .light
                                                                ? Colors.white
                                                                : Colors.black,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Image.asset(
                                                              "assets/icons/icon-cart.png",
                                                              width: 20,
                                                              height: 20,
                                                              color: theme.theme ==
                                                                      ThemeMode
                                                                          .light
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fit: BoxFit
                                                                  .contain,
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
                                                    style:
                                                        GoogleFonts.ebGaramond(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: RichText(
                                                    textAlign: TextAlign.start,
                                                    text: TextSpan(
                                                      text:
                                                          '${controller.listProduct[index].price ?? '--'}',
                                                      style: GoogleFonts
                                                          .ebGaramond(
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: RatingBarIndicator(
                                                    rating: double.parse(
                                                        controller
                                                            .listProduct[index]
                                                            .rating
                                                            .toString()),
                                                    itemBuilder:
                                                        (context, index) =>
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
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'no_information'.tr,
                                              style: GoogleFonts.ebGaramond(
                                                color: theme.theme ==
                                                        ThemeMode.light
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
