import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_controller.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
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
                                const ProductFavoritePage(
                                  id: AppConstant.BLOG,
                                ),
                                id: AppConstant.BLOG);
                          },
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                const CartPage(id: AppConstant.BLOG),
                                id: AppConstant.BLOG,
                              );
                            },
                            child: Image.asset(
                              "assets/icons/icon_cart.png",
                              width: 20,
                              height: 20,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: GetBuilder<BlogController>(
                      init: blogController,
                      builder: (controller) => RefreshIndicator(
                        onRefresh: () async {
                          controller.onInit();
                          controller.update();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 140,
                          ),
                          child: PagedListView<int, Blog>(
                            pagingController: controller.pagingController,
                            builderDelegate: PagedChildBuilderDelegate<Blog>(
                              noItemsFoundIndicatorBuilder: (context) =>
                                  Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'asset/icons/no_data.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      'no_data'.tr,
                                      style: TextStyle(
                                        color: Color(0xff404040),
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              itemBuilder: (context, item, index) =>
                                  GestureDetector(
                                onTap: () {
                                  Get.to(BlogDetailPage(blog: item),
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
                                          imageUrl: item.imageBlog ?? '',
                                          useOldImageOnUrlChange: false,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${AppTranslation.instance.language == AppTranslation.english ? (item.titleEn != null && item.titleEn!.isNotEmpty ? item.titleEn : '--') : (item.titleVi != null && item.titleVi!.isNotEmpty ? item.titleVi : '--')}',
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
                                                '${AppTranslation.instance.language == AppTranslation.english ? (item.descriptionShortEn != null && item.descriptionShortEn!.isNotEmpty ? item.descriptionShortEn : '--') : (item.descriptionShortVi != null && item.descriptionShortVi!.isNotEmpty ? item.descriptionShortVi : '--')}',
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
                                                    item.createdAt != null &&
                                                            item.createdAt!
                                                                .isNotEmpty
                                                        ? DateFormat(
                                                                'HH:mm dd/MM/yyyy')
                                                            .format(DateTime.parse(
                                                                    item.createdAt ??
                                                                        '')
                                                                .toLocal())
                                                        : '--',
                                                    style:
                                                        GoogleFonts.ebGaramond(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
