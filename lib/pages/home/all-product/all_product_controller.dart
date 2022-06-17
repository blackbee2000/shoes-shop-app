import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class AllProductController extends GetxController {
  List<Product> listProduct = <Product>[].obs;
  List<Product> listTrendingProduct = <Product>[].obs;
  List<String> listProductFavorite = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  getDiscountProduct() {
    HomeProvider().getDiscountProduct(
      option: Options(),
      beforeSend: () {
        Get.dialog(
          const SizedBox(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          barrierDismissible: false,
        );
      },
      onSuccess: (res) {
        listProduct = res.data ?? [];
        for (var e in listProduct) {
          e.isLike = false;
        }
        if (ApiToken.to.isTokenExisted == true) {
          getListProductFavorite(listProduct);
        }
        Get.back();
        update();
      },
      onError: (e) {
        Get.back();
        update();
      },
    );
  }

  getTrendingProduct() {
    HomeProvider().getTrendingProduct(
      option: Options(),
      beforeSend: () {
        Get.dialog(
          const SizedBox(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          barrierDismissible: false,
        );
      },
      onSuccess: (res) {
        listProduct = res.data ?? [];
        for (var e in listProduct) {
          e.isLike = false;
        }
        if (ApiToken.to.isTokenExisted == true) {
          getListProductFavorite(listProduct);
        }
        Get.back();
        update();
      },
      onError: (e) {
        Get.back();
        update();
      },
    );
  }

  getListProductFavorite(List<Product> productList) {
    ProfileProvider().getListProductFavorite(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProductFavorite = res.data ?? [];

        for (var x in productList) {
          for (var k in listProductFavorite) {
            if (k == x.id) {
              x.isLike = true;
            }
          }
        }
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  likeProduct(String id, bool isLike) {
    ProductProvider().likeProduct(
      params: {"idProduct": id},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        if (isLike == false) {
          Get.snackbar(
            'success'.tr,
            'product_liked',
            colorText: Colors.white,
            backgroundColor: const Color(0xff00FF00),
          );
        } else {
          Get.snackbar(
            'success'.tr,
            'product_canceled_like'.tr,
            colorText: Colors.white,
            backgroundColor: const Color(0xff00FF00),
          );
        }

        for (var e in listProduct) {
          if (id == e.id) {
            e.isLike = !e.isLike!;
          }
        }
        update();
      },
      onError: (e) {
        Get.snackbar(
          'fail'.tr,
          'happen_error'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }
}
