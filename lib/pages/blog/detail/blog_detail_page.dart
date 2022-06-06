import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_controller.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;

class BlogDetailPage extends StatelessWidget {
  final Blog blog;
  final blogDetailController = Get.put(BlogDetailController());

  BlogDetailPage({Key? key, required this.blog}) : super(key: key);

  Future<void> share(title, description, link) async {
    await FlutterShare.share(
      title: title,
      text: description,
      linkUrl: link,
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
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: blog.imageBlog ?? '',
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
                                  '${AppTranslation.instance.language == AppTranslation.english ? (blog.titleEn != null && blog.titleEn!.isNotEmpty ? blog.titleEn : '--') : (blog.titleVi != null && blog.titleVi!.isNotEmpty ? blog.titleVi : '--')}',
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.white,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      blog.time != null && blog.time!.isNotEmpty
                                          ? DateFormat('HH:mm dd/MM/yyyy')
                                              .format(DateTime.parse(
                                                      blog.time ?? '')
                                                  .toLocal())
                                          : '--',
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.white,
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
                                  AppTranslation.instance.language ==
                                          AppTranslation.english
                                      ? share(blog.titleEn,
                                          blog.descriptionShortEn, blog.link)
                                      : share(blog.titleEn,
                                          blog.descriptionShortEn, blog.link);
                                },
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
                      child: AppTranslation.instance.language ==
                              AppTranslation.english
                          ? (blog.contentEn != null &&
                                  blog.contentEn!.isNotEmpty
                              ? Text(
                                  parse(blog.contentEn).outerHtml,
                                )
                              : Column(
                                  children: [
                                    const Icon(
                                      Icons.block,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    Text(
                                      'no_information'.tr,
                                      style: GoogleFonts.ebGaramond(
                                        color: const Color(0xff404040),
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ))
                          : (blog.contentVi != null &&
                                  blog.contentVi!.isNotEmpty
                              ? Text(
                                  parse(blog.contentVi).outerHtml,
                                )
                              : Column(
                                  children: [
                                    const Icon(
                                      Icons.block,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    Text(
                                      'no_information'.tr,
                                      style: GoogleFonts.ebGaramond(
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
                                        imageUrl: '',
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
                                              'This is my shoes, say la la laa',
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
                                                  '00:00 20/09/2000',
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
