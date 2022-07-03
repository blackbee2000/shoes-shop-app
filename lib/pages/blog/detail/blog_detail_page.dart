import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_controller.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_controller.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import '../../cart/cart_controller.dart';
import '../../home/badge.dart';

class BlogDetailPage extends StatefulWidget {
  final int id;
  final Blog blog;
  BlogDetailPage({Key? key, required this.id, required this.blog})
      : super(key: key);

  @override
  State<BlogDetailPage> createState() => BlogDetailState();
}

class BlogDetailState extends State<BlogDetailPage> {
  final blogDetailController = Get.put(BlogDetailController());
  final blogController = Get.put(BlogController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    blogDetailController.blogDetail.value = widget.blog;
    BackButtonInterceptor.add(myInterceptor);
    blogDetailController.getAllBlogDifferent(widget.blog.id ?? '');
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (widget.id == AppConstant.BLOG) {
      Get.back(id: AppConstant.BLOG);
      return true;
    }
    return false;
  }

  Future<void> share(title, description, link) async {
    await FlutterShare.share(
      title: title,
      text: description,
      linkUrl: link,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: AppConstant.BLOG)}
      },
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Get.back(id: AppConstant.BLOG);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  title: Text(
                    "blog_detail_title".tr,
                    style: TextStyle(
                      color: Colors.black,
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
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: GetBuilder<CartController>(
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            Get.to(
                              const CartPage(id: AppConstant.BLOG),
                              id: AppConstant.BLOG,
                            );
                          },
                          child: Badge(
                            value: controller.listCart.length,
                            child: Image.asset(
                              "assets/icons/icon_cart.png",
                              width: 20,
                              height: 20,
                              color: Colors.black,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              blogDetailController.blogDetail.value.imageBlog ??
                                  '',
                          useOldImageOnUrlChange: false,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => ClipOval(
                            child: Container(),
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
                                    '${AppTranslation.instance.language == AppTranslation.english ? (widget.blog.titleEn != null && widget.blog.titleEn!.isNotEmpty ? widget.blog.titleEn : '--') : (widget.blog.titleVi != null && widget.blog.titleVi!.isNotEmpty ? widget.blog.titleVi : '--')}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/icon_calendar.png",
                                        width: 13,
                                        height: 13,
                                        fit: BoxFit.contain,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        blogDetailController.blogDetail.value
                                                        .createdAt !=
                                                    null &&
                                                blogDetailController.blogDetail
                                                    .value.createdAt!.isNotEmpty
                                            ? DateFormat('HH:mm dd/MM/yyyy')
                                                .format(DateTime.parse(
                                                        blogDetailController
                                                                .blogDetail
                                                                .value
                                                                .createdAt ??
                                                            '')
                                                    .toLocal())
                                            : '--',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
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
                                  onTap: () {
                                    AppTranslation
                                                .instance.language ==
                                            AppTranslation.english
                                        ? share(
                                            blogDetailController
                                                .blogDetail.value.titleEn,
                                            blogDetailController.blogDetail
                                                .value.descriptionShortEn,
                                            blogDetailController
                                                .blogDetail.value.link)
                                        : share(
                                            blogDetailController
                                                .blogDetail.value.titleEn,
                                            blogDetailController.blogDetail
                                                .value.descriptionShortEn,
                                            blogDetailController
                                                .blogDetail.value.link);
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/icon-share.png',
                                        width: 30,
                                        height: 30,
                                        color: Colors.black,
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
                        child: AppTranslation.instance.language ==
                                AppTranslation.english
                            ? (blogDetailController
                                            .blogDetail.value.contentEn !=
                                        null &&
                                    blogDetailController
                                        .blogDetail.value.contentEn!.isNotEmpty
                                ? Html(
                                    data: blogDetailController
                                        .blogDetail.value.contentEn)
                                : Column(
                                    children: [
                                      const Icon(
                                        Icons.block,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                      Text(
                                        'no_information'.tr,
                                        style: TextStyle(
                                          color: const Color(0xff404040),
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ))
                            : (blogDetailController
                                            .blogDetail.value.contentVi !=
                                        null &&
                                    blogDetailController
                                        .blogDetail.value.contentVi!.isNotEmpty
                                ? Html(
                                    data: blogDetailController
                                        .blogDetail.value.contentVi)
                                : Column(
                                    children: [
                                      const Icon(
                                        Icons.block,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                      Text(
                                        'no_information'.tr,
                                        style: TextStyle(
                                          color: const Color(0xff404040),
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'blog_detail_related'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<BlogDetailController>(
                        init: blogDetailController,
                        builder: (controller) => Column(
                          children: controller.listBlogDifferent.isNotEmpty
                              ? controller.listBlogDifferent
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        Get.dialog(
                                          const SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        Colors.white),
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          ),
                                          barrierDismissible: false,
                                        );
                                        Future.delayed(
                                                Duration(milliseconds: 500))
                                            .then((_) {
                                          setState(() {
                                            controller.blogDetail.value = e;
                                            controller.update();
                                          });
                                          Get.back();
                                          scrollController.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.linear,
                                          );
                                        });
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
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: e.imageBlog ?? '',
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
                                                      '${AppTranslation.instance.language == AppTranslation.english ? (e.titleEn != null && e.titleEn!.isNotEmpty ? e.titleEn : '--') : (e.titleVi != null && e.titleVi!.isNotEmpty ? e.titleVi : '--')}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '${AppTranslation.instance.language == AppTranslation.english ? (e.descriptionShortEn != null && e.descriptionShortEn!.isNotEmpty ? e.descriptionShortEn : '--') : (e.descriptionShortVi != null && e.descriptionShortVi!.isNotEmpty ? e.descriptionShortVi : '--')}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                          e.createdAt != null &&
                                                                  e.createdAt!
                                                                      .isNotEmpty
                                                              ? DateFormat(
                                                                      'HH:mm dd/MM/yyyy')
                                                                  .format(DateTime.parse(
                                                                          e.createdAt ??
                                                                              '')
                                                                      .toLocal())
                                                              : '--',
                                                          style: TextStyle(
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
                                  )
                                  .toList()
                              : [],
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
    );
  }
}
