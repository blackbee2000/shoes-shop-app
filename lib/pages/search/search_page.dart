import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/style_shoes.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/profile/product_favorite/product_favorite_page.dart';
import 'package:shoes_shop_app/pages/search/search_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  final searchController = Get.put(SearchController());

  SearchPage({Key? key}) : super(key: key);

  Widget sortView(productList) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: GetBuilder<SearchController>(
        init: searchController,
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.sortSelected.value = 'search_price'.tr;
                controller.sortProductSearch(productList, 'price');
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  'search_price'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black.withOpacity(0.05),
            ),
            GestureDetector(
              onTap: () {
                controller.sortSelected.value = 'search_shoes_name'.tr;
                controller.sortProductSearch(productList, 'name');
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'search_shoes_name'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.SEARCH),
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
                  title: Text(
                    "search_title".tr,
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
                            const ProductFavoritePage(
                              id: AppConstant.SEARCH,
                            ),
                            id: AppConstant.SEARCH);
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
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            const CartPage(id: AppConstant.SEARCH),
                            id: AppConstant.SEARCH,
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
                    ),
                  ],
                ),
                body: GetBuilder<SearchController>(
                  init: searchController,
                  builder: (controller) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.theme == ThemeMode.light
                                ? const Color(0xffF0F0F0)
                                : const Color(0xff333333),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.shoeName,
                            style: TextStyle(
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                bottom: 7,
                                left: 15,
                              ),
                              hintText: 'search_enter_shoes_name'.tr,
                              hintStyle: TextStyle(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                            cursorColor: theme.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.theme == ThemeMode.light
                                ? const Color(0xffF0F0F0)
                                : const Color(0xff333333),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownSearch<Company>(
                            showClearButton: controller.showClearButton.value,
                            clearButton: Icon(
                              Icons.close,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              size: 15,
                            ),
                            dropDownButton: Icon(
                              Icons.arrow_drop_down,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              size: 25,
                            ),
                            popupShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            showSearchBox: true,
                            mode: Mode.BOTTOM_SHEET,
                            items: controller.listCompany,
                            selectedItem: controller.nameCompany.value,
                            popupItemBuilder: (context, item, isSelected) =>
                                Container(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.nameCompany ?? '',
                                style: TextStyle(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            itemAsString: (item) {
                              return item?.nameCompany ??
                                  'search_select_brand'.tr;
                            },
                            dropdownBuilder: (context, item) {
                              return Text(
                                item?.nameCompany ?? 'search_select_brand'.tr,
                                style: TextStyle(
                                  color: item == null
                                      ? const Color(0xffD0D0D0)
                                      : theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                            onSaved: (item) {},
                            onChanged: (item) {
                              if (item != null) {
                                controller.showClearButton.value = true;
                                controller.nameCompany.value = item;
                                controller.idCompany.value = item.id!;
                                controller.update();
                              }
                            },
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              isDense: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: const Color(0xffD0D0D0),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.theme == ThemeMode.light
                                ? const Color(0xffF0F0F0)
                                : const Color(0xff333333),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownSearch<StyleShoes>(
                            showClearButton:
                                controller.showClearButtonStyle.value,
                            clearButton: Icon(
                              Icons.close,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              size: 15,
                            ),
                            dropDownButton: Icon(
                              Icons.arrow_drop_down,
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              size: 25,
                            ),
                            popupShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            showSearchBox: true,
                            mode: Mode.BOTTOM_SHEET,
                            items: controller.listStyle,
                            selectedItem: controller.styleValue.value,
                            popupItemBuilder: (context, item, isSelected) =>
                                Container(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.name ?? '',
                                style: TextStyle(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            itemAsString: (item) {
                              return item?.name ?? 'search_select_style'.tr;
                            },
                            dropdownBuilder: (context, item) {
                              return Text(
                                item?.name ?? 'search_select_style'.tr,
                                style: TextStyle(
                                  color: item == null
                                      ? const Color(0xffD0D0D0)
                                      : theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                            onSaved: (item) {},
                            onChanged: (item) {
                              if (item != null) {
                                controller.showClearButtonStyle.value = true;
                                controller.styleValue.value = item;
                                controller.style.value = item.name!;
                                controller.update();
                              }
                            },
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              isDense: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: const Color(0xffD0D0D0),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
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
                                flex: 6,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.listProductSearch.clear();
                                    controller.search(
                                        controller.shoeName.text,
                                        controller.idCompany.value,
                                        controller.style.value);
                                    controller.sortSelected.value = '';
                                    controller.update();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'search_title'.tr,
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 6,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.listProductSearch.clear();
                                    controller.shoeName.clear();
                                    controller.idCompany.value = '';
                                    controller.nameCompany.value =
                                        Company.fromJson({});
                                    controller.showClearButton.value = false;
                                    controller.style.value = '';
                                    controller.styleValue.value =
                                        StyleShoes.fromJson({});
                                    controller.showClearButtonStyle.value =
                                        false;
                                    controller.sortSelected.value = '';
                                    controller.update();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'search_clear'.tr,
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
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
                          () => GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  sortView(controller.listProductSearch));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    Icons.sort,
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.white
                                        : Colors.black,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  searchController.sortSelected.value,
                                  style: TextStyle(
                                    color: theme.theme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: controller.listProductSearch.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.52,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount:
                                      controller.listProductSearch.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        ProductDetailPage(
                                          product: controller
                                              .listProductSearch[index],
                                          id: AppConstant.SEARCH,
                                        ),
                                        id: AppConstant.SEARCH,
                                      );
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (ApiToken
                                                        .to.isTokenExisted) {
                                                      if (controller
                                                              .listProductSearch[
                                                                  index]
                                                              .isLike ==
                                                          false) {
                                                        controller.likeProduct(
                                                            controller
                                                                    .listProductSearch[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                            false);
                                                      } else {
                                                        controller.likeProduct(
                                                            controller
                                                                    .listProductSearch[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                            true);
                                                      }
                                                      controller.update();
                                                    } else {
                                                      Get.bottomSheet(
                                                          loginPopup(context));
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 36,
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 41,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.white
                                                            : Colors.black,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: controller
                                                                    .listProductSearch[
                                                                        index]
                                                                    .isLike ==
                                                                true
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color: theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                                size: 20,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: theme.theme ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                                size: 20,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Center(
                                                    child: CachedNetworkImage(
                                                      width: 90,
                                                      fit: BoxFit.contain,
                                                      imageUrl: controller
                                                          .listProductSearch[
                                                              index]
                                                          .imageProduct!,
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
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 36,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    width: 41,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: theme.theme ==
                                                              ThemeMode.light
                                                          ? Colors.white
                                                          : Colors.black,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "assets/icons/icon-cart.png",
                                                        width: 20,
                                                        height: 20,
                                                        color: theme.theme ==
                                                                ThemeMode.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${AppTranslation.instance.language == AppTranslation.english ? (controller.listProductSearch[index].nameProductEn != null && controller.listProductSearch[index].nameProductEn!.isNotEmpty ? controller.listProductSearch[index].nameProductEn : '--') : (controller.listProductSearch[index].nameProductVi != null && controller.listProductSearch[index].nameProductVi!.isNotEmpty ? controller.listProductSearch[index].nameProductVi : '--')}',
                                              style: TextStyle(
                                                color: theme.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                text:
                                                    CurrencyTextInputFormatter(
                                                  locale: AppTranslation
                                                              .instance
                                                              .language ==
                                                          AppTranslation.english
                                                      ? "vi_VN"
                                                      : "en_US",
                                                  decimalDigits: 0,
                                                  symbol: "",
                                                ).format((controller
                                                            .listProductSearch[
                                                                index]
                                                            .price)
                                                        .toString()),
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
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: RatingBarIndicator(
                                              rating: double.tryParse(controller
                                                      .listProductSearch[index]
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
                                        ],
                                      ),
                                    ),
                                  ),
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
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
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
