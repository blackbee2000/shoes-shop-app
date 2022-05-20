import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class YourOrderDetailPage extends StatelessWidget {
  const YourOrderDetailPage({Key? key}) : super(key: key);
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
              fit: BoxFit.cover,
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
                child: Column(
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
                            color: const Color(0xff00C42B),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/icon-done.png',
                                width: 30,
                                height: 30,
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
                                    '20092000T21',
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
                                    'Total: 250',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Order date: 20/09/2000',
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
                                      'Delivered',
                                      style: GoogleFonts.ebGaramond(
                                        color: Color(0xff00C32B),
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
                            children: [1, 2, 3, 4, 5]
                                .map(
                                  (e) => Container(
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
                                    height: 140,
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
                                                  'Price: 250',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Total: 250',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Amount: 1',
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
                                )
                                .toList(),
                          ),
                        ),
                        onRefresh: () async {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
