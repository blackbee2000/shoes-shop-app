import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/address/address_controller.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';

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
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'cart_address'.tr,
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        'assets/icons/icon-address-payment.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${controller.addressPayment.value.nameReciever != null && controller.addressPayment.value.nameReciever!.isNotEmpty ? controller.addressPayment.value.nameReciever : '--'} - ${controller.addressPayment.value.phoneReciever != null && controller.addressPayment.value.phoneReciever!.isNotEmpty ? controller.addressPayment.value.phoneReciever : '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${controller.addressPayment.value.street != null && controller.addressPayment.value.street!.isNotEmpty ? controller.addressPayment.value.street : '--'}' +
                                        ', ' +
                                        '${controller.addressPayment.value.ward != null && controller.addressPayment.value.ward!.isNotEmpty ? controller.addressPayment.value.ward : '--'}' +
                                        ', ' +
                                        '${controller.addressPayment.value.district != null && controller.addressPayment.value.district!.isNotEmpty ? controller.addressPayment.value.district : '--'}' +
                                        ', ' +
                                        '${controller.addressPayment.value.province != null && controller.addressPayment.value.province!.isNotEmpty ? controller.addressPayment.value.province : '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    AddressPage(
                                      id: widget.id,
                                    ),
                                    id: widget.id);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/icon-right.png',
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
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
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
                                                      decoration: BoxDecoration(
                                                        color: e.value
                                                                    .isChecked ==
                                                                true
                                                            ? theme.theme ==
                                                                    ThemeMode
                                                                        .light
                                                                ? Colors.black
                                                                : Colors.white
                                                            : theme.theme ==
                                                                    ThemeMode
                                                                        .light
                                                                ? Colors.white
                                                                : Colors.black,
                                                        border: Border.all(
                                                          color: theme.theme ==
                                                                  ThemeMode
                                                                      .light
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                        shape: BoxShape.circle,
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
                                                  child: Center(
                                                    child: CachedNetworkImage(
                                                      width: 70,
                                                      fit: BoxFit.contain,
                                                      imageUrl: e
                                                              .value
                                                              .lstProduct!
                                                              .imageProduct ??
                                                          '',
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
                                                Container(
                                                  width: 10,
                                                  height: double.infinity,
                                                  color:
                                                      const Color(0xffFFD9D9),
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
                                                          '${e.value.lstProduct!.nameProductEn != null && e.value.lstProduct!.nameProductEn!.isNotEmpty ? e.value.lstProduct!.nameProductEn : '--'}',
                                                          style: GoogleFonts
                                                              .ebGaramond(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
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
                                                          'total'.tr +
                                                              '${e.value.totalPrice ?? '--'}',
                                                          style: GoogleFonts
                                                              .ebGaramond(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                              child: Container(
                                                                width: 25,
                                                                height: 25,
                                                                color: Colors
                                                                    .black,
                                                                child: Center(
                                                                  child: Text(
                                                                    '-',
                                                                    style: GoogleFonts
                                                                        .ebGaramond(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              '1',
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
                                                              width: 15,
                                                            ),
                                                            ClipOval(
                                                              child: Container(
                                                                width: 25,
                                                                height: 25,
                                                                color: Colors
                                                                    .black,
                                                                child: Center(
                                                                  child: Text(
                                                                    '+',
                                                                    style: GoogleFonts
                                                                        .ebGaramond(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
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
                                  .toList()),
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
                              Text(
                                'cart_select_all'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.getListCartSelected(widget.id);
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
                              Text(
                                'cart_delete'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
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
