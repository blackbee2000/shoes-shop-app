import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_controller.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';

class CartPage extends StatefulWidget {
  final int id;
  const CartPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  CartState createState() => CartState();
}

class CartState extends State<CartPage> {
  final cartController = Get.put(CartController());
  final dashboardController = Get.put(DashboardController());

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
                'cart_title'.tr,
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
                          ProductFavoritePage(
                            id: widget.id,
                          ),
                          id: widget.id);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: theme.theme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.black.withOpacity(0),
            body: GetBuilder<CartController>(
              init: cartController,
              builder: (controller) => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.update();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: controller.listCart.isNotEmpty
                              ? Column(
                                  children: controller.listCart
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: GestureDetector(
                                                onTap: () {
                                                  e.value.isChecked =
                                                      !e.value.isChecked!;
                                                  controller.update();
                                                },
                                                child: ClipOval(
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      border: Border.all(
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: ClipOval(
                                                        child: Container(
                                                          width: 15,
                                                          height: 15,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: e.value
                                                                        .isChecked ==
                                                                    true
                                                                ? theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white
                                                                : theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                            border: Border.all(
                                                              color: theme.theme ==
                                                                      ThemeMode
                                                                          .light
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 10,
                                              child: Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 20,
                                                ),
                                                margin: const EdgeInsets.only(
                                                  bottom: 20,
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 150,
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
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: double.infinity,
                                                      color: Colors.black,
                                                      child: RotatedBox(
                                                        quarterTurns: 1,
                                                        child: Center(
                                                          child:
                                                              CachedNetworkImage(
                                                            width: 90,
                                                            fit: BoxFit.contain,
                                                            imageUrl: e
                                                                .value
                                                                .lstProduct!
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
                                                                  value: downloadProgress
                                                                      .progress,
                                                                  valueColor:
                                                                      const AlwaysStoppedAnimation(
                                                                          Colors
                                                                              .white),
                                                                  strokeWidth:
                                                                      2,
                                                                ),
                                                              ),
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    ClipOval(
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10,
                                                      height: double.infinity,
                                                      color: const Color(
                                                          0xffFFD9D9),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 15,
                                                          bottom: 15,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${e.value.lstProduct!.nameProductEn != null && e.value.lstProduct!.nameProductEn!.isNotEmpty ? e.value.lstProduct!.nameProductEn : '--'}',
                                                              style: GoogleFonts
                                                                  .ebGaramond(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'price'.tr +
                                                                  '${e.value.lstProduct!.price ?? '--'}',
                                                              style: GoogleFonts
                                                                  .ebGaramond(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'total'.tr +
                                                                  '${e.value.totalPrice ?? '--'}',
                                                              style: GoogleFonts
                                                                  .ebGaramond(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipOval(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      controller.minusAmount(
                                                                          e.value
                                                                              .id!,
                                                                          e.value
                                                                              .amount!);
                                                                      controller
                                                                          .update();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      color: Colors
                                                                          .black,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '-',
                                                                          style:
                                                                              GoogleFonts.ebGaramond(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Text(
                                                                  '${e.value.amount ?? 1}',
                                                                  style: GoogleFonts
                                                                      .ebGaramond(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                ClipOval(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      controller.plusAmount(
                                                                          e.value
                                                                              .id!,
                                                                          e.value
                                                                              .amount!);
                                                                      controller
                                                                          .update();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      color: Colors
                                                                          .black,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '+',
                                                                          style:
                                                                              GoogleFonts.ebGaramond(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList())
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
                                        'no_cart'.tr,
                                        style: GoogleFonts.ebGaramond(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          dashboardController.tabIndex.value =
                                              1;
                                          while (Get.nestedKey(
                                                      AppConstant.PRODUCT)!
                                                  .currentState
                                                  ?.canPop() ==
                                              true) {
                                            Get.nestedKey(AppConstant.PRODUCT)
                                                ?.currentState
                                                ?.pop();
                                          }
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.white
                                                    : Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'go_to_product'.tr,
                                              style: GoogleFonts.ebGaramond(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffD9D9D9),
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.getAllListCartSelected();
                                  controller.update();
                                },
                                child: Text(
                                  'cart_select_all'.tr,
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.getListCartSelected(widget.id);
                                  controller.update();
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'cart_payment'.tr,
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.deleteMultiCart();
                                  controller.update();
                                },
                                child: Text(
                                  'cart_delete'.tr,
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
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
        ),
      ),
    );
  }
}
