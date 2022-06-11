import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/pages/your-order/your_order_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'your-order-detail/your_order_detail_page.dart';

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({Key? key}) : super(key: key);

  @override
  State<YourOrderPage> createState() => YourOrderState();
}

class YourOrderState extends State<YourOrderPage> {
  final yourOderController = Get.put(YourOrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back(id: AppConstant.PROFILE);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              'bill_and_order'.tr,
              style: GoogleFonts.ebGaramond(
                color: Colors.black,
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
                        id: AppConstant.PROFILE,
                      ),
                      id: AppConstant.PROFILE);
                },
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Colors.black,
                ),
              ),
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
                    color: Colors.black,
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
          body: GetBuilder<YourOrderController>(
            init: yourOderController,
            builder: (controller) => SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listTabOrderStatus.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          controller.tabController.index = index;
                          controller.listOrder.clear();
                          controller.getOrderStatus(
                              controller.listTabOrderStatus[index].code ?? 0);
                          controller.update();
                        },
                        child: Container(
                          margin: index == 0
                              ? const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                )
                              : const EdgeInsets.only(
                                  left: 0,
                                  right: 20,
                                ),
                          width: 180,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.tabController.index == index
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '${controller.listTabOrderStatus[index].image}',
                                width: 20,
                                height: 20,
                                color: controller.tabController.index == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${controller.listTabOrderStatus[index].name}',
                                style: GoogleFonts.ebGaramond(
                                  color: controller.tabController.index == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: controller.listOrder.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/icon-box.png',
                                  width: 45,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'no_information'.tr,
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.listOrder.length,
                            itemBuilder: (e, index) => GestureDetector(
                              onTap: () {
                                Get.to(const YourOrderDetailPage(),
                                    id: AppConstant.PROFILE);
                              },
                              child: Container(
                                width: double.infinity,
                                margin: index == 0
                                    ? const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      )
                                    : index == controller.listOrder.length - 1
                                        ? const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 40,
                                          )
                                        : const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                          ),
                                height: 100,
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: double.infinity,
                                      color: controller.listOrder[index]
                                                  .statusPayment ==
                                              true
                                          ? const Color(0xff00C42B)
                                          : const Color(0xffFFD600),
                                      child: Center(
                                        child: Image.asset(
                                          controller.listOrder[index]
                                                      .statusPayment ==
                                                  true
                                              ? 'assets/icons/icon-done.png'
                                              : 'assets/icons/icon-shipping.png',
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                      height: double.infinity,
                                      color: const Color(0xffFFD9D9),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.listOrder[index].id != null && controller.listOrder[index].id!.isNotEmpty ? controller.listOrder[index].id?.substring(0, 10) : '--'}',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${'payment_total_bill'.tr} ${controller.listOrder[index].totalPrice ?? '--'}',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                controller.listOrder[index]
                                                            .statusPayment ==
                                                        true
                                                    ? 'delivered'.tr
                                                    : 'delivering'.tr,
                                                style: GoogleFonts.ebGaramond(
                                                  color: controller
                                                              .listOrder[index]
                                                              .statusPayment ==
                                                          true
                                                      ? const Color(0xff00C32B)
                                                      : const Color(0xffFFD600),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
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
      ),
    );
  }
}
