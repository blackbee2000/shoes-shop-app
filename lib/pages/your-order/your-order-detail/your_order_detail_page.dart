import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/order.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/your-order/your-order-detail/your_order_detail_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class YourOrderDetailPage extends StatelessWidget {
  final Order order;
  YourOrderDetailPage({Key? key, required this.order}) : super(key: key);
  final yourOrderDetailController = Get.put(YourOrderDetailController());

  Widget ratingDialog(BuildContext context, String idProduct) {
    final _formkey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GetBuilder<YourOrderDetailController>(
        init: yourOrderDetailController,
        builder: (controller) => Form(
          key: _formkey,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'rate_product'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: double.tryParse(
                          controller.ratingController.value.toString()) ??
                      0.0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    controller.ratingController.value =
                        double.tryParse(rating.toString()) ?? 0.0;
                    controller.update();
                  },
                ),
                const SizedBox(height: 20),
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
                              if (controller.rateProductNowOfAccount.value
                                      .idProduct ==
                                  idProduct) {
                                controller
                                        .rateProductNowOfAccount.value.rating =
                                    double.tryParse(controller
                                        .ratingController.value
                                        .toString());
                                print(
                                    'RATING ===> ${controller.rateProductNowOfAccount.value.rating}');
                                controller.updateRateByAccount(
                                    controller.rateProductNowOfAccount.value);
                              } else {
                                controller.createRating(
                                    double.tryParse(controller
                                        .ratingController.value
                                        .toString()),
                                    idProduct);
                              }
                              Get.back();
                              controller.update();
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_update_profile.jpg',
              width: double.infinity,
              height: 500,
              fit: BoxFit.fill,
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black.withOpacity(0),
                leading: IconButton(
                  onPressed: () {
                    Get.back(id: AppConstant.PROFILE);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'your_order_detail'.tr,
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
                      Get.to(CartPage(id: AppConstant.PROFILE),
                          id: AppConstant.PROFILE);
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
              backgroundColor: Colors.black.withOpacity(0),
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: GetBuilder<YourOrderDetailController>(
                  init: yourOrderDetailController,
                  builder: (controller) => Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        height: 115,
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
                              color: order.statusPayment == true
                                  ? const Color(0xff00C42B)
                                  : const Color(0xffFFD600),
                              child: Center(
                                child: Image.asset(
                                  order.statusPayment == true
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${order.id != null && order.id!.isNotEmpty ? order.id : '--'}',
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
                                      '${'payment_total_bill'.tr} ${order.totalPrice ?? '--'}',
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
                                        order.statusPayment == true
                                            ? 'delivered'.tr
                                            : 'delivering'.tr,
                                        style: GoogleFonts.ebGaramond(
                                          color: order.statusPayment == true
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
                      Expanded(
                        child: RefreshIndicator(
                          child: SingleChildScrollView(
                            child: Column(
                              children: order.lstCart!.isNotEmpty
                                  ? order.lstCart!
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
                                              height: 170,
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
                                                    width: 120,
                                                    height: double.infinity,
                                                    color: Colors.black,
                                                    child: Center(
                                                      child: CachedNetworkImage(
                                                        width: 70,
                                                        fit: BoxFit.contain,
                                                        imageUrl: e.lstProduct!
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
                                                            '${e.lstProduct!.nameProductEn != null && e.lstProduct!.nameProductEn!.isNotEmpty ? e.lstProduct!.nameProductEn : '--'}',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.black,
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
                                                                '${e.lstProduct!.price ?? '--'}',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child:
                                                                RatingBarIndicator(
                                                              rating: double.tryParse(e
                                                                      .lstProduct!
                                                                      .rating
                                                                      .toString()) ??
                                                                  0.0,
                                                              itemBuilder: (context,
                                                                      index) =>
                                                                  const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              itemCount: 5,
                                                              itemSize: 16,
                                                              direction: Axis
                                                                  .horizontal,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'amount'.tr +
                                                                '${e.amount ?? '--'}',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.black,
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
                                                                '${e.totalPrice ?? '--'}',
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.getRatingByAccount(
                                                      e.lstProduct!.id!);
                                                  Get.bottomSheet(ratingDialog(
                                                      context,
                                                      e.lstProduct!.id!));
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'rate'.tr,
                                                      style: GoogleFonts
                                                          .ebGaramond(
                                                        color: Colors.white,
                                                        fontSize: 12,
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
                                      )
                                      .toList()
                                  : [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/icon-box.png',
                                              width: 45,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'no_information'.tr,
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                            ),
                          ),
                          onRefresh: () async {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
