import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/product/product_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  final productController = Get.put(ProductController());

  ProductPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.PRODUCT),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/product_banner.jpg",
                  width: double.infinity,
                  height: 225,
                  fit: BoxFit.cover,
                ),
                Scaffold(
                  backgroundColor: Colors.black.withOpacity(0),
                  appBar: AppBar(
                    backgroundColor: Colors.black.withOpacity(0),
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
                            CartPage(id: AppConstant.PRODUCT),
                            id: AppConstant.PRODUCT,
                          );
                        },
                        child: Image.asset(
                          "assets/icons/icon_cart.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: GestureDetector(
                          child: Image.asset(
                            "assets/icons/icon_message.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                                itemCount: 10,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 60,
                                  height: double.infinity,
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
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Nike',
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
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.52,
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
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 36,
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: 41,
                                                  height: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Image.asset(
                                                      "assets/icons/icon-like.png",
                                                      width: 20,
                                                      height: 20,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Center(
                                                child: Image.asset(
                                                  "assets/images/product_home.png",
                                                  width: 80,
                                                  fit: BoxFit.contain,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                        Text(
                                          '${AppTranslation.instance.language == AppTranslation.english ? (controller.listProduct[index].nameProductEn != null && controller.listProduct[index].nameProductEn!.isNotEmpty ? controller.listProduct[index].nameProductEn : '--') : (controller.listProduct[index].nameProductVi != null && controller.listProduct[index].nameProductVi!.isNotEmpty ? controller.listProduct[index].nameProductVi : '--')}',
                                          style: GoogleFonts.ebGaramond(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
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
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
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
                                            rating: 5,
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
