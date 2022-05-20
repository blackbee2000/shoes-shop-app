import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_controller.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetailPage extends StatelessWidget {
  final blogDetailController = Get.put(BlogDetailController());

  BlogDetailPage({Key? key}) : super(key: key);

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
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
              "assets/images/background_blog_detail.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.black.withOpacity(0),
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back(id: AppConstant.BLOG);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.black.withOpacity(0),
                title: Text(
                  "blog_detail_title".tr,
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
                        CartPage(id: AppConstant.BLOG),
                        id: AppConstant.BLOG,
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/blog_detail_banner.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Jordan chất điên, cháy cả cộng đồng mạng",
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/icons/icon_calendar.png",
                                      width: 13,
                                      height: 13,
                                      fit: BoxFit.contain,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '10:00 - 27/02/2022',
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: share,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icon-share.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
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
                      child: Column(
                        children: [
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typespecimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            'assets/images/blog_detail_banner.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    WidgetMask(
                      blendMode: BlendMode.difference,
                      mask: Text(
                        'blog_detail_related'.tr,
                        style: GoogleFonts.ebGaramond(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WidgetMask(
                      blendMode: BlendMode.difference,
                      mask: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 1,
                        color: Colors.black,
                      ),
                      child: Container(
                        width: 50,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [1, 2, 3, 4, 5]
                          .map(
                            (e) => GestureDetector(
                              // onTap: () {
                              //   Get.to(BlogDetailPage());
                              // },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                  left: 20,
                                  right: 20,
                                ),
                                height: 125,
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
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 20,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/blog-item.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 5,
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
                                          children: [
                                            Text(
                                              'Jordan chất điên, cháy cả cộng đồng mạng',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'It is a long established fact that a reader will be distracted by the readable content of a page, It is a long established fact that a reader will be distracted by the readable content of a page',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/icon_calendar.png",
                                                  width: 10,
                                                  height: 10,
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '10:00 - 27/02/2022',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
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
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
