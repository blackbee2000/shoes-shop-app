import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/address/address_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/payment/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  final int id;
  CartPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back(id: id);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              'cart_title'.tr,
              style: GoogleFonts.ebGaramond(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: GestureDetector(
                  child: Image.asset(
                    "assets/icons/icon_message.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black.withOpacity(0),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                            'Trần Thái Tuấn',
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
                            '108 Sao Hoả, Hệ Mặt Trời',
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(AddressPage());
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
                Obx(
                  () => Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          children: [1, 2, 3, 4, 5, 6]
                              .asMap()
                              .entries
                              .map(
                                (e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          cartController.indexSelected.value =
                                              e.key;
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
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
                                                            cartController
                                                                .indexSelected
                                                                .value
                                                        ? Colors.black
                                                        : Colors.white,
                                                    border: Border.all(
                                                      color: Colors.black,
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
                                        height: 140,
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
                                                child: Image.asset(
                                                  "assets/images/product_home.png",
                                                  width: 70,
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
                                                      'Jordan chất điên, cháy cả cộng đồng mạng',
                                                      style: GoogleFonts
                                                          .ebGaramond(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Price: 250',
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
                                                      'Total: 250',
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
                                                            color: Colors.black,
                                                            child: Center(
                                                              child: Text(
                                                                '-',
                                                                style: GoogleFonts
                                                                    .ebGaramond(
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                          offset:
                              const Offset(0, 4), // changes position of shadow
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
                            Get.to(PaymentPage(id: id), id: id);
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
    );
  }
}
