import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/detail/product_detail_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';

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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back(id: widget.id);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            title: Text(
              'product_detail_title'.tr,
              style: GoogleFonts.ebGaramond(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(CartPage(id: widget.id), id: widget.id);
                },
                child: Image.asset(
                  "assets/icons/icon_cart.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: Colors.black,
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
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black.withOpacity(0),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
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
                              color: Colors.black,
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
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/icon-like.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Image.asset(
                                  "assets/images/product_home.png",
                                  width: 100,
                                  fit: BoxFit.contain,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  '${AppTranslation.instance.language == AppTranslation.english ? (widget.product.nameProductEn != null && widget.product.nameProductEn!.isNotEmpty ? widget.product.nameProductEn : '--') : (widget.product.nameProductVi != null && widget.product.nameProductVi!.isNotEmpty ? widget.product.nameProductVi : '--')}',
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '${widget.product.price ?? '--'}',
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: widget.product.type!
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        width: 28,
                                        height: 28,
                                        color: Colors.black,
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: RatingBarIndicator(
                                  rating: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30,
                                  direction: Axis.horizontal,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'product_detail_size'.tr,
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Obx(
                                    () => DropdownButton<String>(
                                      value: productDetailController
                                          .sizeShoes.value,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),
                                      iconSize: 20,
                                      underline: Container(),
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      onChanged: (String? newValue) {
                                        productDetailController
                                            .sizeShoes.value = newValue!;
                                      },
                                      items: <String>[
                                        '35',
                                        '36',
                                        '37',
                                        '38',
                                        '39',
                                        '40',
                                        '41',
                                        '42',
                                        '43'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.ebGaramond(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 100,
                                height: 1,
                                color: Colors.black,
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 30,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 30,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
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
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'product_detail_add_cart'.tr,
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Container(
                              width: 135,
                              height: 135,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/jordan.png',
                                  ),
                                  fit: BoxFit.contain,
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
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'product_detail_description'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'product_detail_other'.tr,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
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
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '${AppTranslation.instance.language == AppTranslation.english ? (widget.product.descriptionEn != null && widget.product.descriptionEn!.isNotEmpty ? widget.product.descriptionEn : '--') : (widget.product.descriptionVi != null && widget.product.descriptionVi!.isNotEmpty ? widget.product.descriptionVi : '--')}',
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Material: Canvas',
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Shoe code: ${widget.product.productCode}',
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
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
                          style: GoogleFonts.ebGaramond(
                            color: Colors.black,
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
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {},
                      height: 290,
                      viewportFraction: 0.5,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                    items: [1, 2, 3, 4, 5, 6]
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/product_home.png",
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Jordan Off White',
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
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
    );
  }
}
