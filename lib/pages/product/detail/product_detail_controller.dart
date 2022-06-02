import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final sizeShoes = '35'.obs;
  final tabIndex = 0.obs;
  final amount = 1.obs;

  plusAmount() {
    amount.value = amount.value + 1;
  }

  minusAmount() {
    if (amount.value < 1) {
      Get.snackbar(
        'Warning',
        'Vui lòng chọn đúng số lượng',
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
      return;
    }
    amount.value = amount.value - 1;
  }
}
