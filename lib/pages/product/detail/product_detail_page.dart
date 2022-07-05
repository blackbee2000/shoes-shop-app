import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_controller.dart';
import 'package:shoes_shop_app/pages/product/product_controller.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import '../../cart/cart_controller.dart';
import '../../home/badge.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final Product product;
  const ProductDetailPage({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  final productDetailController = Get.put(ProductDetailController());
  late TabController tabController;
  final productController = Get.put(ProductController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    productDetailController.productDetail.value = widget.product;
    productDetailController.isLike.value =
        productDetailController.productDetail.value.isLike ?? false;
    if (productDetailController.productDetail.value.type!.isNotEmpty) {
      productDetailController.sizeShoes.value =
          productDetailController.productDetail.value.type!.first.size!;
      productDetailController.productDetail.value.type?.forEach((e) {
        if (e.quantity != 0) {
          productDetailController.listSize.add(e.size!.toString());
        }
      });
    } else {
      productDetailController.listSize.value = [];
    }

    for (var e in productController.listCompany) {
      if (e.id == productDetailController.productDetail.value.idCompany) {
        productDetailController.companyData.value = e;
      }
    }

    productDetailController
        .getProductRelated(productDetailController.productDetail.value.id!);

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
    tabController.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.back(id: widget.id);
    return true;
  }

  Widget loginPopup(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'notification'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'login_popup'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                            style: TextStyle(
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
                        Get.to(const LoginPage());
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
                            style: TextStyle(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addToCart(
    BuildContext context,
    Product product,
    String size,
    String color,
    int amount,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'notification'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'add_to_cart'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                            style: TextStyle(
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
                  GetBuilder<ProductDetailController>(
                    init: productDetailController,
                    builder: (controller) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context);
                          Get.back();
                          controller.addToCart(
                              product, size, color, amount, widget.id);
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chooseSize(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'product_detail_size_choose'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<ProductDetailController>(
              init: productDetailController,
              builder: (controller) => Column(
                children: controller.listSize
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          productDetailController.sizeShoes.value = e;
                          Get.back();
                        },
                        child: Text(
                          e.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList()
                    .cast(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: widget.id)}
      },
      child: SafeArea(
        child: GetBuilder<ThemeController>(
          builder: (theme) => Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.theme == ThemeMode.light ? Colors.white : Colors.black,
            child: Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: theme.theme == ThemeMode.light
                        ? Colors.white
                        : Colors.black,
                    bottom: theme.theme == ThemeMode.dark
                        ? PreferredSize(
                            child: Container(
                              width: double.infinity,
                              color: const Color(0xffF01101),
                              height: 1,
                            ),
                            preferredSize: const Size.fromHeight(0),
                          )
                        : PreferredSize(
                            child: Container(),
                            preferredSize: const Size.fromHeight(0),
                          ),
                    leading: IconButton(
                      onPressed: () {
                        Get.back(id: widget.id);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    title: Text(
                      'product_detail_title'.tr,
                      style: TextStyle(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    centerTitle: false,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              ProductFavoritePage(
                                id: widget.id,
                              ),
                              id: AppConstant.HOME);
                        },
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: GetBuilder<CartController>(
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              Get.to(
                                CartPage(id: widget.id),
                                id: widget.id,
                              );
                            },
                            child: Badge(
                              value: controller.listCart.length,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: theme.theme == ThemeMode.light
                      ? Colors.white
                      : Colors.black,
                  body: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: double.infinity,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        GetBuilder<ProductDetailController>(
                                          init: productDetailController,
                                          builder: (controller) =>
                                              GestureDetector(
                                            onTap: () {
                                              if (ApiToken.to.isTokenExisted) {
                                                if (productDetailController
                                                        .productDetail
                                                        .value
                                                        .isLike ==
                                                    false) {
                                                  productController.likeProduct(
                                                      productDetailController
                                                              .productDetail
                                                              .value
                                                              .id ??
                                                          '',
                                                      false);
                                                } else {
                                                  productController.likeProduct(
                                                      productDetailController
                                                              .productDetail
                                                              .value
                                                              .id ??
                                                          '',
                                                      true);
                                                }
                                                productController.update();
                                                controller.isLike.value =
                                                    !controller.isLike.value;
                                              } else {
                                                Get.bottomSheet(
                                                    loginPopup(context));
                                              }

                                              controller.update();
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 36,
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                width: 41,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: controller
                                                              .isLike.value ==
                                                          true
                                                      ? Icon(
                                                          Icons.favorite,
                                                          color: theme.theme ==
                                                                  ThemeMode
                                                                      .light
                                                              ? Colors.black
                                                              : Colors.white,
                                                          size: 20,
                                                        )
                                                      : Icon(
                                                          Icons.favorite_border,
                                                          color: theme.theme ==
                                                                  ThemeMode
                                                                      .light
                                                              ? Colors.black
                                                              : Colors.white,
                                                          size: 20,
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: CachedNetworkImage(
                                            width: 120,
                                            fit: BoxFit.contain,
                                            imageUrl: productDetailController
                                                .productDetail
                                                .value
                                                .imageProduct!,
                                            useOldImageOnUrlChange: false,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value:
                                                      downloadProgress.progress,
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
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          '${AppTranslation.instance.language == AppTranslation.english ? (productDetailController.productDetail.value.nameProductEn != null && productDetailController.productDetail.value.nameProductEn!.isNotEmpty ? productDetailController.productDetail.value.nameProductEn : '--') : (productDetailController.productDetail.value.nameProductVi != null && productDetailController.productDetail.value.nameProductVi!.isNotEmpty ? productDetailController.productDetail.value.nameProductVi : '--')}',
                                          style: TextStyle(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: CurrencyTextInputFormatter(
                                                locale: AppTranslation.instance
                                                            .language ==
                                                        AppTranslation.english
                                                    ? "vi_VN"
                                                    : "en_US",
                                                decimalDigits: 0,
                                                symbol: "",
                                              ).format((productDetailController
                                                      .productDetail
                                                      .value
                                                      .price)
                                                  .toString()),
                                              style: TextStyle(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    productDetailController
                                                                .productDetail
                                                                .value
                                                                .discount ==
                                                            0
                                                        ? TextDecoration.none
                                                        : TextDecoration
                                                            .lineThrough,
                                              ),
                                            ),
                                          ),
                                          productDetailController.productDetail
                                                      .value.discount ==
                                                  0
                                              ? Container()
                                              : RichText(
                                                  text: TextSpan(
                                                    text:
                                                        ' - ${productDetailController.productDetail.value.discount ?? 0} %',
                                                    style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      productDetailController.productDetail
                                                  .value.discount ==
                                              0
                                          ? Container()
                                          : Container(
                                              alignment: Alignment.topLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      CurrencyTextInputFormatter(
                                                    locale: AppTranslation
                                                                .instance
                                                                .language ==
                                                            AppTranslation
                                                                .english
                                                        ? "vi_VN"
                                                        : "en_US",
                                                    decimalDigits: 0,
                                                    symbol: "",
                                                  ).format(((productDetailController
                                                                      .productDetail
                                                                      .value
                                                                      .price! *
                                                                  (100 -
                                                                      productDetailController
                                                                          .productDetail
                                                                          .value
                                                                          .discount!) /
                                                                  100) /
                                                              10)
                                                          .toString()),
                                                  style: TextStyle(
                                                    color: theme.theme ==
                                                            ThemeMode.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: RatingBarIndicator(
                                          rating: double.tryParse(
                                                  productDetailController
                                                      .productDetail
                                                      .value
                                                      .rating
                                                      .toString()) ??
                                              5.0,
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
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.bottomSheet(chooseSize(context));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'product_detail_size'.tr,
                                              style: TextStyle(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Obx(
                                              () => Text(
                                                productDetailController
                                                    .sizeShoes.value,
                                                style: TextStyle(
                                                  color: theme.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 1,
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GetBuilder<ProductDetailController>(
                            init: productDetailController,
                            builder: (controller) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.white
                                            : Colors.black,
                                        border: Border.all(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.minusAmount();
                                              },
                                              child: Container(
                                                width: 30,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: theme.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => Expanded(
                                              flex: 6,
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Center(
                                                  child: Text(
                                                    controller.amount
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.plusAmount();
                                              },
                                              child: Container(
                                                width: 30,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: theme.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: GestureDetector(
                                      onTap: () {
                                        ApiToken().isTokenExisted
                                            ? Get.bottomSheet(addToCart(
                                                context,
                                                productDetailController
                                                    .productDetail.value,
                                                controller.sizeShoes.value,
                                                'black',
                                                controller.amount.value,
                                              ))
                                            : Get.bottomSheet(
                                                loginPopup(context));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'product_detail_add_cart'.tr,
                                              style: TextStyle(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/icons/icon-add-to-cart.png',
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.contain,
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: productDetailController.productDetail.value
                                            .listImageDetail !=
                                        null &&
                                    productDetailController.productDetail.value
                                        .listImageDetail!.isNotEmpty
                                ? 130
                                : 10,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productDetailController.productDetail
                                              .value.listImageDetail !=
                                          null &&
                                      productDetailController.productDetail
                                          .value.listImageDetail!.isNotEmpty
                                  ? productDetailController.productDetail.value
                                      .listImageDetail!.length
                                  : 0,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  productDetailController.isShowPopup.value =
                                      !productDetailController
                                          .isShowPopup.value;
                                  productDetailController.indexSelected.value =
                                      index;
                                },
                                child: Container(
                                  width: 170,
                                  margin: index == 9
                                      ? EdgeInsets.only(right: 0)
                                      : EdgeInsets.only(right: 15),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    imageUrl: productDetailController
                                        .productDetail
                                        .value
                                        .listImageDetail![index],
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
                            height: 30,
                          ),
                          GetBuilder<ProductDetailController>(
                            init: productDetailController,
                            builder: (controller) => Align(
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.black
                                            : const Color(0xffF01101),
                                        width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: ClipOval(
                                      child: Container(
                                        width: 135,
                                        height: 135,
                                        decoration: BoxDecoration(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.white,
                                          border: Border.all(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : const Color(0xffF01101),
                                              width: 2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          imageUrl: controller.companyData.value
                                                  .logoCompany ??
                                              '',
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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TabBar(
                              controller: tabController,
                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              tabs: [
                                Tab(
                                  child: Text(
                                    'product_detail_description'.tr,
                                    style: TextStyle(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'product_detail_other'.tr,
                                    style: TextStyle(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                            height: 230,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    '${AppTranslation.instance.language == AppTranslation.english ? (productDetailController.productDetail.value.descriptionEn != null && productDetailController.productDetail.value.descriptionEn!.isNotEmpty ? productDetailController.productDetail.value.descriptionEn : '--') : (productDetailController.productDetail.value.descriptionVi != null && productDetailController.productDetail.value.descriptionVi!.isNotEmpty ? productDetailController.productDetail.value.descriptionVi : '--')}',
                                    style: TextStyle(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Thể loại: Sneaker',
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Material: Canvas',
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Shoe code: ${productDetailController.productDetail.value.productCode}',
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(
                                  'product_detail_related'.tr,
                                  style: TextStyle(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 80,
                                  height: 1,
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GetBuilder<ProductDetailController>(
                            init: productDetailController,
                            builder: (controller) => controller
                                    .listProductRelated.isNotEmpty
                                ? CarouselSlider(
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {},
                                      height: 290,
                                      viewportFraction: 0.5,
                                      enableInfiniteScroll: true,
                                      enlargeCenterPage: true,
                                    ),
                                    items: controller.listProductRelated
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              Get.dialog(
                                                const SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Colors.white),
                                                      strokeWidth: 2,
                                                    ),
                                                  ),
                                                ),
                                                barrierDismissible: false,
                                              );
                                              Future.delayed(Duration(
                                                      milliseconds: 500))
                                                  .then((_) {
                                                setState(() {
                                                  controller
                                                      .productDetail.value = e;
                                                  controller.update();
                                                });
                                                Get.back();
                                                scrollController.animateTo(
                                                  0,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.linear,
                                                );
                                              });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              decoration: BoxDecoration(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RotatedBox(
                                                    quarterTurns: 1,
                                                    child: CachedNetworkImage(
                                                      width: 140,
                                                      fit: BoxFit.contain,
                                                      imageUrl: e.imageProduct!,
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
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    '${e.nameProductEn != null && e.nameProductEn!.isNotEmpty ? e.nameProductEn : '--'}',
                                                    style: TextStyle(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/icon-box.png',
                                          width: 45,
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'no_information'.tr,
                                          style: TextStyle(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Obx(
                                          () => Text(
                                            productDetailController
                                                .sizeShoes.value,
                                            style: TextStyle(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          size: 18,
                                        ),
                                      ],
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
                Obx(
                  () => Visibility(
                    visible: productDetailController.isShowPopup.value == true,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            productDetailController.isShowPopup.value =
                                !productDetailController.isShowPopup.value;
                          },
                          child: Container(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          left: 0,
                          right: 0,
                          bottom: 160,
                          child: Container(
                            width: context.width - 30,
                            child: PopupDetailImage(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopupDetailImage extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();
  final productDetailController = Get.put(ProductDetailController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) => GetBuilder<ProductDetailController>(
        init: productDetailController,
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.indexSelected.value = index;
                    controller.update();
                  },
                  height: double.infinity,
                  autoPlay: false,
                  viewportFraction: 1,
                  initialPage: controller.indexSelected.value,
                  enableInfiniteScroll: true,
                ),
                items: controller.productDetail.value.listImageDetail!
                    .map(
                      (e) => Container(
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: e,
                          useOldImageOnUrlChange: false,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => ClipOval(
                            child: Container(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.productDetail.value.listImageDetail!
                      .asMap()
                      .entries
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ClipOval(
                            child: Container(
                              width: 10,
                              height: 10,
                              color: e.key == controller.indexSelected.value
                                  ? Colors.black
                                  : Color(0xffD9D9D9),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
