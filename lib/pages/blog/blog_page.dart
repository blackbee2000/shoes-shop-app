import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/blog/blog_controller.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class BlogPage extends StatelessWidget {
  final blogController = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.BLOG),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: GetBuilder<ThemeController>(
            builder: (theme) => Container(
              width: double.infinity,
              height: double.infinity,
              color:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(
                    "assets/images/blog_banner.jpg",
                    width: double.infinity,
                    height: 225,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 60,
                    left: 120,
                    right: 120,
                    child: Image.asset(
                      "assets/images/lifekicky.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.black.withOpacity(0),
                    appBar: AppBar(
                      backgroundColor: Colors.black.withOpacity(0),
                      title: Text(
                        "blog_title".tr,
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
                    body: GetBuilder<BlogController>(
                      init: blogController,
                      builder: (controller) => RefreshIndicator(
                        onRefresh: () async {
                          controller.update();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 140,
                          ),
                          child: ListView.builder(
                            itemCount: controller.listBlog.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(
                                    BlogDetailPage(
                                        blog: controller.listBlog[index]),
                                    id: AppConstant.BLOG);
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                  left: 20,
                                  right: 20,
                                ),
                                height: 130,
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
                                      ),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: controller
                                                .listBlog[index].imageBlog ??
                                            '',
                                        useOldImageOnUrlChange: false,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                              valueColor:
                                                  const AlwaysStoppedAnimation(
                                                      Colors.white),
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            ClipOval(
                                          child: Container(),
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
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${AppTranslation.instance.language == AppTranslation.english ? (controller.listBlog[index].descriptionShortEn != null && controller.listBlog[index].descriptionShortEn!.isNotEmpty ? controller.listBlog[index].descriptionShortEn : '--') : (controller.listBlog[index].descriptionShortVi != null && controller.listBlog[index].descriptionShortVi!.isNotEmpty ? controller.listBlog[index].descriptionShortVi : '--')}',
                                              style: GoogleFonts.ebGaramond(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 5,
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
                                                  controller.listBlog[index]
                                                                  .time !=
                                                              null &&
                                                          controller
                                                              .listBlog[index]
                                                              .time!
                                                              .isNotEmpty
                                                      ? DateFormat(
                                                              'HH:mm dd/MM/yyyy')
                                                          .format(DateTime.parse(controller
                                                                      .listBlog[
                                                                          index]
                                                                      .time ??
                                                                  '')
                                                              .toLocal())
                                                      : '--',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: Colors.black,
                                                    fontSize: 12,
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
