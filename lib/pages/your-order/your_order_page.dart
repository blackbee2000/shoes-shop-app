import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/pages/your-order/your_order_controller.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'your-order-detail/your_order_detail_page.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({Key? key}) : super(key: key);

  @override
  State<YourOrderPage> createState() => YourOrderState();
}

class YourOrderState extends State<YourOrderPage> {
  final yourOderController = Get.put(YourOrderController());

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.back(id: AppConstant.PROFILE);
    return true;
  }

  Widget cancelOrder(BuildContext context, String id) {
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
                      'order_cancel'.tr,
                      style: TextStyle(
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
                'order_warning'.tr,
                style: TextStyle(
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
                      onTap: () => Get.back(),
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
                            style: TextStyle(
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
                  GetBuilder<YourOrderController>(
                    init: yourOderController,
                    builder: (controller) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.cancelOrder(id);
                          controller.update();
                          Get.back();
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
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
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: AppConstant.PROFILE)}
      },
      child: SafeArea(
        child: GetBuilder<ThemeController>(
          builder: (theme) => Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
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
                    Get.back(id: AppConstant.PROFILE);
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
                  'bill_and_order'.tr,
                  style: TextStyle(
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
                            id: AppConstant.PROFILE,
                          ),
                          id: AppConstant.PROFILE);
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
                              if (index == 0) {
                                controller.statusOrder.value = true;
                              } else {
                                controller.statusOrder.value = false;
                              }
                              controller.getOrderStatus(
                                  controller.listTabOrderStatus[index].code ??
                                      0);
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
                                    ? theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white
                                    : theme.theme == ThemeMode.light
                                        ? Colors.white
                                        : Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    '${controller.listTabOrderStatus[index].image}',
                                    width: 20,
                                    height: 20,
                                    color:
                                        controller.tabController.index == index
                                            ? theme.theme == ThemeMode.light
                                                ? Colors.white
                                                : Colors.black
                                            : theme.theme == ThemeMode.light
                                                ? Colors.black
                                                : Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${controller.listTabOrderStatus[index].name}',
                                    style: TextStyle(
                                      color: controller.tabController.index ==
                                              index
                                          ? theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black
                                          : theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
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
                      controller.statusOrder.value == true
                          ? Expanded(
                              child: controller.listOrder.isEmpty
                                  ? Container(
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
                                            style: TextStyle(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: controller.listOrder.length,
                                      itemBuilder: (e, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              YourOrderDetailPage(
                                                  order: controller
                                                      .listOrder[index]),
                                              id: AppConstant.PROFILE);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          margin: index == 0
                                              ? const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                )
                                              : index ==
                                                      controller.listOrder
                                                              .length -
                                                          1
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
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                spreadRadius: 0,
                                                blurRadius: 4,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: double.infinity,
                                                color: controller
                                                            .listOrder[index]
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 15,
                                                    bottom: 15,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.listOrder[index].id != null && controller.listOrder[index].id!.isNotEmpty ? controller.listOrder[index].id : '--'}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${'payment_total_bill'.tr} ${CurrencyTextInputFormatter(
                                                          locale: AppTranslation
                                                                      .instance
                                                                      .language ==
                                                                  AppTranslation
                                                                      .english
                                                              ? "vi_VN"
                                                              : "en_US",
                                                          decimalDigits: 0,
                                                          symbol: "",
                                                        ).format((controller.listOrder[index].totalPrice).toString())}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        controller
                                                                    .listOrder[
                                                                        index]
                                                                    .statusPayment ==
                                                                true
                                                            ? 'delivered'.tr
                                                            : 'delivering'.tr,
                                                        style: TextStyle(
                                                          color: controller
                                                                      .listOrder[
                                                                          index]
                                                                      .statusPayment ==
                                                                  true
                                                              ? const Color(
                                                                  0xff00C32B)
                                                              : const Color(
                                                                  0xffFFD600),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.bottomSheet(cancelOrder(
                                                      context,
                                                      controller
                                                              .listOrder[index]
                                                              .id ??
                                                          ''));
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 20,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            )
                          : Expanded(
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
                                            style: TextStyle(
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
                                      itemBuilder: (e, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              YourOrderDetailPage(
                                                  order: controller
                                                      .listOrder[index]),
                                              id: AppConstant.PROFILE);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          margin: index == 0
                                              ? const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                )
                                              : index ==
                                                      controller.listOrder
                                                              .length -
                                                          1
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
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                spreadRadius: 0,
                                                blurRadius: 4,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: double.infinity,
                                                color: controller
                                                            .listOrder[index]
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 15,
                                                    bottom: 15,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.listOrder[index].id != null && controller.listOrder[index].id!.isNotEmpty ? controller.listOrder[index].id : '--'}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${'payment_total_bill'.tr} ${CurrencyTextInputFormatter(
                                                          locale: AppTranslation
                                                                      .instance
                                                                      .language ==
                                                                  AppTranslation
                                                                      .english
                                                              ? "vi_VN"
                                                              : "en_US",
                                                          decimalDigits: 0,
                                                          symbol: "",
                                                        ).format((controller.listOrder[index].totalPrice).toString())}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Text(
                                                          controller
                                                                      .listOrder[
                                                                          index]
                                                                      .statusPayment ==
                                                                  true
                                                              ? 'delivered'.tr
                                                              : 'delivering'.tr,
                                                          style: GoogleFonts
                                                              .ebGaramond(
                                                            color: controller
                                                                        .listOrder[
                                                                            index]
                                                                        .statusPayment ==
                                                                    true
                                                                ? const Color(
                                                                    0xff00C32B)
                                                                : const Color(
                                                                    0xffFFD600),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
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
        ),
      ),
    );
  }
}
