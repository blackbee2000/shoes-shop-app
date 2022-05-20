import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'your-order-detail/your_order_detail_page.dart';

class YourOrderPage extends StatelessWidget {
  const YourOrderPage({Key? key}) : super(key: key);
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
              'assets/images/background_singin.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
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
                  'your_order_title'.tr,
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
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (e, index) => GestureDetector(
                    onTap: () {
                      Get.to(const YourOrderDetailPage(),
                          id: AppConstant.PROFILE);
                    },
                    child: Container(
                      width: double.infinity,
                      margin: index == [1, 2, 3, 4, 5, 6, 7, 8].length - 1
                          ? const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 20,
                            )
                          : const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                      height: 95,
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
