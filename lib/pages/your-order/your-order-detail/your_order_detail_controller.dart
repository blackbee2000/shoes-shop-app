import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/rating.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class YourOrderDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ratingController = 0.0.obs;
  final rateProductNowOfAccount = Rating.fromJson({}).obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getRatingByAccount(String idProduct) {
    ProductProvider().getRatingByAccount(
      params: {"idProduct": idProduct},
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        if (res.data != null) {
          rateProductNowOfAccount.value = res.data!;
          ratingController.value = (rateProductNowOfAccount.value.rating != null
              ? double.tryParse(rateProductNowOfAccount.value.rating.toString())
              : 0.0)!;
        } else {
          ratingController.value = 0.0;
        }
        update();
        print('GET RATING BY ACCOUNT SUCCESS ===> ${res.data.toString()}');
      },
      onError: (e) {
        print('GET RATING BY ACCOUNT FAIL  ===> ${e.toString()}');
        update();
      },
    );
  }

  createRating(dynamic rating, String idProduct) {
    ProductProvider().createRating(
      params: {"idProduct": idProduct, "rating": double.parse(rating)},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
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
        Get.back();
        Get.snackbar(
          'success'.tr,
          'rate_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );

        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'rate_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }

  updateRateByAccount(Rating rating) {
    ProductProvider().updateRating(
      params: rating.toJson(),
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
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
        Get.back();
        Get.snackbar(
          'success'.tr,
          'rate_update_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        update();
        print('UPDATEEEE BY ACCOUNT SUCCESS ===> ${res.data.toString()}');
      },
      onError: (e) {
        print('UPDATEEEE BY ACCOUNT FAIL  ===> ${e.toString()}');
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'rate_update_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }
}
