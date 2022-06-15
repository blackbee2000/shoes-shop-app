import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/product/product_controller.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_controller.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductFavoritePage extends StatefulWidget {
  final int id;
  const ProductFavoritePage({Key? key, required this.id}) : super(key: key);
  @override
  ProductFavoriteState createState() => ProductFavoriteState();
}

class ProductFavoriteState extends State<ProductFavoritePage> {
  final productFavoriteController = Get.put(ProductFavoriteController());
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ThemeController>(
        builder: (theme) => Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.theme == ThemeMode.light ? Colors.white : Colors.black,
          child: Scaffold(
            backgroundColor:
                theme.theme == ThemeMode.light ? Colors.white : Colors.black,
            appBar: AppBar(
              backgroundColor:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              leading: IconButton(
                onPressed: () {
                  Get.back(id: widget.id);
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
                "product_favorite_title".tr,
                style: GoogleFonts.ebGaramond(
                  color: theme.theme == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        const CartPage(id: AppConstant.PROFILE),
                        id: AppConstant.PROFILE,
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
            body: GetBuilder<ProductFavoriteController>(
              init: productFavoriteController,
              builder: (controller) => RefreshIndicator(
                onRefresh: () async {
                  controller.update();
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 40,
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.52,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.listProductFavoriteFinal.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(
                          ProductDetailPage(
                            product: controller.listProductFavoriteFinal[index],
                            id: widget.id,
                          ),
                          id: widget.id,
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.likeProduct(controller
                                              .listProductFavoriteFinal[index]
                                              .id ??
                                          '');
                                      productController.onInit();
                                      productController.update();
                                      controller.update();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 36,
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 41,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: controller
                                                      .listProductFavoriteFinal[
                                                          index]
                                                      .isLike ==
                                                  true
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: Colors.black,
                                                  size: 20,
                                                )
                                              : const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.black,
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
                                    child: CachedNetworkImage(
                                      width: 80,
                                      fit: BoxFit.contain,
                                      imageUrl: controller
                                          .listProductFavoriteFinal[index]
                                          .imageProduct!,
                                      useOldImageOnUrlChange: false,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            valueColor:
                                                const AlwaysStoppedAnimation(
                                                    Colors.white),
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
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
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 41,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.white
                                            : Colors.black,
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/icons/icon-cart.png",
                                          width: 20,
                                          height: 20,
                                          color: theme.theme == ThemeMode.light
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
                                '${AppTranslation.instance.language == AppTranslation.english ? (controller.listProductFavoriteFinal[index].nameProductEn != null && controller.listProductFavoriteFinal[index].nameProductEn!.isNotEmpty ? controller.listProductFavoriteFinal[index].nameProductEn : '--') : (controller.listProductFavoriteFinal[index].nameProductVi != null && controller.listProductFavoriteFinal[index].nameProductVi!.isNotEmpty ? controller.listProductFavoriteFinal[index].nameProductVi : '--')}',
                                style: GoogleFonts.ebGaramond(
                                  color: theme.theme == ThemeMode.light
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
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text:
                                      '${controller.listProductFavoriteFinal[index].price ?? '--'}',
                                  style: GoogleFonts.ebGaramond(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
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
                                rating: double.parse(controller
                                    .listProductFavoriteFinal[index].rating
                                    .toString()),
                                itemBuilder: (context, index) => const Icon(
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
