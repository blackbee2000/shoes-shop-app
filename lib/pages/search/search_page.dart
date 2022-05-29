import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_page.dart';
import 'package:shoes_shop_app/pages/search/search_controller.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'package:shoes_shop_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  TextEditingController shoeName = TextEditingController();
  final listSelect = [
    'Nike',
    'Jordan',
    'Adidas',
    'Converse',
    'Vans',
  ];
  final searchController = Get.put(SearchController());

  SearchPage({Key? key}) : super(key: key);

  Widget sortView() {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              searchController.sortSelected.value = 'search_price'.tr;
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'search_price'.tr,
                style: GoogleFonts.ebGaramond(
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
              searchController.sortSelected.value = 'search_shoes_name'.tr;
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'search_shoes_name'.tr,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
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
                    style: GoogleFonts.ebGaramond(
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
                          CartPage(id: AppConstant.SEARCH),
                          id: AppConstant.SEARCH,
                        );
                      },
                      child: Image.asset(
                        "assets/icons/icon_cart.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
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
                          color: theme.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                body: Container(
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
                          controller: shoeName,
                          style: GoogleFonts.ebGaramond(
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
                            hintStyle: GoogleFonts.ebGaramond(
                              color: const Color(0xffD0D0D0),
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
                        child: DropdownSearch<String>(
                          showClearButton: false,
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
                          items: listSelect,
                          popupItemBuilder: (context, item, isSelected) =>
                              Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              item,
                              style: GoogleFonts.ebGaramond(
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          itemAsString: (item) {
                            return item ?? 'search_select_brand'.tr;
                          },
                          dropdownBuilder: (context, item) {
                            return Text(
                              item ?? 'search_select_brand'.tr,
                              style: GoogleFonts.ebGaramond(
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
                          onChanged: (item) {},
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 15),
                            isDense: true,
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.ebGaramond(
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
                                    style: GoogleFonts.ebGaramond(
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
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 6,
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
                                    style: GoogleFonts.ebGaramond(
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            Get.bottomSheet(sortView());
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
                                style: GoogleFonts.ebGaramond(
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
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.52,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(
                                  ProductDetailPage(
                                    product: Product.fromJson({}),
                                    id: AppConstant.SEARCH,
                                  ),
                                  id: AppConstant.SEARCH);
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.theme == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 36,
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 41,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                "assets/icons/icon-like.png",
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
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Center(
                                          child: Image.asset(
                                            "assets/images/product_home.png",
                                            width: 80,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 36,
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 41,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  theme.theme == ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.black,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jordan 1',
                                        style: GoogleFonts.ebGaramond(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '250',
                                          style: GoogleFonts.ebGaramond(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: RatingBarIndicator(
                                      rating: 5,
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
    );
  }
}
