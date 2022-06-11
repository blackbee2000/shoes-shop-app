import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop_app/models/voucher.dart';
import 'package:shoes_shop_app/pages/address/address_controller.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/payment/payment_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/pages/voucher/voucher_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';

class PaymentPage extends StatefulWidget {
  final int id;
  const PaymentPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<PaymentPage> {
  final paymentController = Get.put(PaymentController());
  final cartController = Get.put(CartController());
  int total = 0;

  @override
  void initState() {
    for (var e in cartController.listCartSelected) {
      total += e.totalPrice!;
    }
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
                  cartController.listCartSelected.clear();
                  cartController.onInit();
                  cartController.update();
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
                'cart_payment'.tr,
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
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
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
                            child: GetBuilder<PaymentController>(
                              init: paymentController,
                              builder: (controller) => Column(
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
                                    '${controller.addressSelected.value.nameReciever != null && controller.addressSelected.value.nameReciever!.isNotEmpty ? controller.addressSelected.value.nameReciever : '--'} - ${controller.addressSelected.value.phoneReciever != null && controller.addressSelected.value.phoneReciever!.isNotEmpty ? controller.addressSelected.value.phoneReciever : '--'}',
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
                                    '${controller.addressSelected.value.street != null && controller.addressSelected.value.street!.isNotEmpty ? controller.addressSelected.value.street : '--'}' +
                                        ', ' +
                                        '${controller.addressSelected.value.ward != null && controller.addressSelected.value.ward!.isNotEmpty ? controller.addressSelected.value.ward : '--'}' +
                                        ', ' +
                                        '${controller.addressSelected.value.district != null && controller.addressSelected.value.district!.isNotEmpty ? controller.addressSelected.value.district : '--'}' +
                                        ', ' +
                                        '${controller.addressSelected.value.province != null && controller.addressSelected.value.province!.isNotEmpty ? controller.addressSelected.value.province : '--'}',
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
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'product_title'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
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
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<PaymentController>(
                      init: paymentController,
                      builder: (controller) => Column(
                        children: cartController.listCartSelected
                            .asMap()
                            .entries
                            .map(
                              (e) => Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                      left: 20,
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
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
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
                                          width: 120,
                                          height: double.infinity,
                                          color: Colors.black,
                                          child: Center(
                                            child: CachedNetworkImage(
                                              width: 70,
                                              fit: BoxFit.contain,
                                              imageUrl: e.value.lstProduct!
                                                  .imageProduct!.first,
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
                                                  '${e.value.lstProduct!.nameProductEn != null && e.value.lstProduct!.nameProductEn!.isNotEmpty ? e.value.lstProduct!.nameProductEn : '--'}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'price'.tr +
                                                      '${e.value.lstProduct!.price ?? '--'}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipOval(
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        color: Colors.black,
                                                        child: Center(
                                                          child: Text(
                                                            '-',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
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
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    ClipOval(
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        color: Colors.black,
                                                        child: Center(
                                                          child: Text(
                                                            '+',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
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
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'total'.tr +
                                                      '${e.value.totalPrice ?? '--'}',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
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
                                  Positioned(
                                    bottom: 20,
                                    right: 20,
                                    child: Container(
                                      width: 70,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'cart_delete'.tr,
                                          style: GoogleFonts.ebGaramond(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: theme.theme == ThemeMode.light
                          ? const Color(0xffCCCCCC)
                          : Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'voucher'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
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
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(VoucherPage(id: widget.id), id: widget.id);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'voucher_select'.tr,
                                  style: GoogleFonts.ebGaramond(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/icons/icon_arrow_right.png",
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<PaymentController>(
                      init: paymentController,
                      builder: (controller) => controller.voucher.value !=
                              Voucher.fromJson({})
                          ? Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.voucher.value.title != null && controller.voucher.value.title!.isNotEmpty ? controller.voucher.value.title : 'no_information'.tr}',
                                          style: GoogleFonts.ebGaramond(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Giảm giá: ${controller.voucher.value.discount ?? '--'}',
                                          style: GoogleFonts.ebGaramond(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Thời hạn: '
                                            '${controller.voucher.value.expiry != null && controller.voucher.value.expiry!.isNotEmpty ? DateFormat('HH:mm - dd/MM/yyyy').format(DateTime.parse(controller.voucher.value.expiry ?? '').toLocal()) : '--'}',
                                            style: GoogleFonts.ebGaramond(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                    'voucher_select'.tr,
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
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: theme.theme == ThemeMode.light
                          ? const Color(0xffCCCCCC)
                          : Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'payment_method'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
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
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<PaymentController>(
                      init: paymentController,
                      builder: (controller) => Column(
                        children: controller.listPayMethod
                            .asMap()
                            .entries
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.only(
                                    bottom: 15, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        width: double.infinity,
                                        height: 37,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                          color: Colors.white,
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
                                        child: Center(
                                          child: Text(
                                            '${e.value.name}',
                                            style: GoogleFonts.ebGaramond(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Obx(
                                        () => Container(
                                          width: double.infinity,
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          child: GestureDetector(
                                            onTap: () {
                                              paymentController
                                                  .indexSelected.value = e.key;
                                              paymentController.typePayment
                                                  .value = e.value.type ?? '';
                                            },
                                            child: ClipOval(
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
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
                                                        color: e.key ==
                                                                paymentController
                                                                    .indexSelected
                                                                    .value
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: theme.theme == ThemeMode.light
                          ? const Color(0xffCCCCCC)
                          : Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: TextSpan(
                          text: 'payment_shipping'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: '2',
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: TextSpan(
                          text: 'payment_total_product'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: '$total',
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: TextSpan(
                          text: 'payment_total_bill'.tr,
                          style: GoogleFonts.ebGaramond(
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: '252',
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<PaymentController>(
                      init: paymentController,
                      builder: (controller) => GestureDetector(
                        onTap: () {
                          controller.payment(
                              controller.voucher.value.voucherCode ?? '',
                              controller.typePayment.value,
                              total,
                              controller.addressSelected.value);
                          controller.update();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'cart_payment'.tr.toUpperCase(),
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
