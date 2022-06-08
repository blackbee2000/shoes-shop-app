import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_controller.dart';
import 'package:shoes_shop_app/pages/home/home_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CarouselController homeCarouselController = CarouselController();
  final homeController = Get.put(HomeController());
  final dashboardController = Get.put(DashboardController());

  // @override
  // void initState() {
  //   homeController.getNewProduct();
  //   homeController.getDiscountProduct();
  //   homeController.getAllCompany();
  //   homeController.getTrendingProduct();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.HOME),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: GetBuilder<ThemeController>(
            builder: (theme) => Container(
              width: double.infinity,
              height: double.infinity,
              color:
                  theme.theme == ThemeMode.light ? Colors.white : Colors.black,
              child: Scaffold(
                backgroundColor: theme.theme == ThemeMode.light
                    ? Colors.white
                    : Colors.black,
                appBar: AppBar(
                  backgroundColor: theme.theme == ThemeMode.light
                      ? Colors.white
                      : Colors.black,
                  title: Image.asset(
                    "assets/images/logo.png",
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  centerTitle: false,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          CartPage(id: AppConstant.HOME),
                          id: AppConstant.HOME,
                        );
                      },
                      child: Image.asset(
                        "assets/icons/icon_cart.png",
                        width: 20,
                        height: 20,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: GestureDetector(
                        child: Image.asset(
                          "assets/icons/icon_message.png",
                          width: 20,
                          height: 20,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                body: GetBuilder<HomeController>(
                  init: homeController,
                  builder: (controller) => RefreshIndicator(
                    onRefresh: () async {
                      controller.update();
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CarouselSlider(
                                carouselController: homeCarouselController,
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    controller.indexSelected.value = index;
                                  },
                                  height: 240,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: false,
                                ),
                                items: controller.listNewProduct
                                    .map(
                                      (e) => Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'home_new_collection'.tr,
                                                  style: GoogleFonts.ebGaramond(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Nike Original 2022',
                                                  style: GoogleFonts.ebGaramond(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${AppTranslation.instance.language == AppTranslation.english ? (e.product!.nameProductEn != null && e.product!.nameProductEn!.isNotEmpty ? e.product!.nameProductEn : '--') : (e.product!.nameProductVi != null && e.product!.nameProductVi!.isNotEmpty ? e.product!.nameProductVi : '--')}',
                                                        style: GoogleFonts
                                                            .ebGaramond(
                                                          color: theme.theme ==
                                                                  ThemeMode
                                                                      .light
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${e.companyName != null && e.companyName!.isNotEmpty ? e.companyName : '--'}',
                                                        style: GoogleFonts
                                                            .ebGaramond(
                                                          color: theme.theme ==
                                                                  ThemeMode
                                                                      .light
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          dashboardController
                                                              .tabIndex
                                                              .value = 2;
                                                        },
                                                        child: Container(
                                                          width: 120,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: theme.theme ==
                                                                      ThemeMode
                                                                          .light
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'home_shop_now'
                                                                    .tr,
                                                                style: GoogleFonts
                                                                    .ebGaramond(
                                                                  color: theme.theme ==
                                                                          ThemeMode
                                                                              .light
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Image.asset(
                                                                "assets/icons/icon_arrow_right.png",
                                                                width: 20,
                                                                height: 20,
                                                                fit: BoxFit
                                                                    .contain,
                                                                color: theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: -78,
                                              child: CachedNetworkImage(
                                                width: 300,
                                                fit: BoxFit.contain,
                                                imageUrl: e.product!
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
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [1, 2, 3, 4, 5]
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: ClipOval(
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            color: e.key ==
                                                    homeController
                                                        .indexSelected.value
                                                ? (theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white)
                                                : const Color(0xffBBBBBB),
                                          ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'home_sales'.tr,
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        dashboardController.tabIndex.value = 2,
                                    child: Row(
                                      children: [
                                        Text(
                                          'home_view_all'.tr,
                                          style: GoogleFonts.ebGaramond(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
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
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: controller.listDiscountProduct.isNotEmpty
                                  ? 310
                                  : 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.listDiscountProduct.length,
                                itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 180,
                                  height: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${AppTranslation.instance.language == AppTranslation.english ? (controller.listDiscountProduct[index].nameProductEn != null && controller.listDiscountProduct[index].nameProductEn!.isNotEmpty ? controller.listDiscountProduct[index].nameProductEn : '--') : (controller.listDiscountProduct[index].nameProductVi != null && controller.listDiscountProduct[index].nameProductVi!.isNotEmpty ? controller.listDiscountProduct[index].nameProductVi : '--')}',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CachedNetworkImage(
                                        width: 80,
                                        fit: BoxFit.contain,
                                        imageUrl: controller
                                            .listDiscountProduct[index]
                                            .imageProduct!
                                            .first,
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
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: '250',
                                            style: GoogleFonts.ebGaramond(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: RatingBarIndicator(
                                          rating: double.tryParse(controller
                                                  .listDiscountProduct[index]
                                                  .rating
                                                  .toString()) ??
                                              0.0,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.to(
                                            ProductDetailPage(
                                              product: controller
                                                  .listDiscountProduct[index],
                                              id: AppConstant.HOME,
                                            ),
                                            id: AppConstant.HOME),
                                        child: Container(
                                          width: double.infinity,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'home_go_detail'.tr,
                                                style: GoogleFonts.ebGaramond(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                "assets/icons/icon_arrow_right.png",
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'home_brands'.tr,
                                style: GoogleFonts.ebGaramond(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.listCompany.length,
                                itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  width: 100,
                                  height: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
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
                                  child: Center(
                                    child: CachedNetworkImage(
                                      width: 80,
                                      fit: BoxFit.contain,
                                      imageUrl: controller
                                              .listCompany[index].logoCompany ??
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
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'home_news_trending'.tr,
                                    style: GoogleFonts.ebGaramond(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      dashboardController.tabIndex.value = 2;
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'home_view_all'.tr,
                                          style: GoogleFonts.ebGaramond(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
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
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 310,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.listTrendingProduct.length,
                                itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 180,
                                  height: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${AppTranslation.instance.language == AppTranslation.english ? (controller.listTrendingProduct[index].nameProductEn != null && controller.listTrendingProduct[index].nameProductEn!.isNotEmpty ? controller.listTrendingProduct[index].nameProductEn : '--') : (controller.listTrendingProduct[index].nameProductVi != null && controller.listTrendingProduct[index].nameProductVi!.isNotEmpty ? controller.listTrendingProduct[index].nameProductVi : '--')}',
                                        style: GoogleFonts.ebGaramond(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CachedNetworkImage(
                                        width: 80,
                                        fit: BoxFit.contain,
                                        imageUrl: controller
                                            .listTrendingProduct[index]
                                            .imageProduct!
                                            .first,
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
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: '250',
                                            style: GoogleFonts.ebGaramond(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: RatingBarIndicator(
                                          rating: double.tryParse(controller
                                                  .listTrendingProduct[index]
                                                  .rating
                                                  .toString()) ??
                                              0.0,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.to(
                                            ProductDetailPage(
                                              product: controller
                                                  .listTrendingProduct[index],
                                              id: AppConstant.HOME,
                                            ),
                                            id: AppConstant.HOME),
                                        child: Container(
                                          width: double.infinity,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'home_go_detail'.tr,
                                                style: GoogleFonts.ebGaramond(
                                                  color: theme.theme ==
                                                          ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                "assets/icons/icon_arrow_right.png",
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
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
            ),
          ),
        ),
      ),
    );
  }
}
