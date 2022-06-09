import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/cart/cart_page.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final sizeShoes = '35'.obs;
  final tabIndex = 0.obs;
  final amount = 1.obs;
  final listSize = <String>[].obs;
  final companyData = Company.fromJson({}).obs;
  List<Product> listProductRelated = <Product>[].obs;
  final profileController = Get.put(ProfileController());
  final cartController = Get.put(CartController());
  final isLike = false.obs;

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

  getProductRelated(String id) {
    ProductProvider().getProductRelated(
      params: {'getId': id},
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listProductRelated = res.data ?? [];
        print(
            'GET RELATED PRODUCT SUCESS ====> ${listProductRelated.toString()}');
        update();
      },
      onError: (e) {
        print('GET RELATED PRODUCT FAIL ====> ${e.toString()}');
        update();
      },
    );
  }

  addToCart(Product product, String size, String color, int amount, idWidget) {
    ProductProvider().addToCart(
      params: {
        "lstProduct": {
          "_id": product.id,
          "nameProductVi": product.nameProductVi,
          "nameProductEn": product.nameProductEn,
          "imageProduct": product.imageProduct!.first,
          "descriptionVi": product.descriptionVi,
          "descriptionEn": product.descriptionEn,
          "rating": product.rating,
          "type": {"size": size, "color": color},
          "idCompany": product.idCompany,
          "price": product.price,
          "productCode": product.productCode
        },
        "isOrdered": false,
        "amount": amount,
        "totalPrice": amount * product.price!,
        "idAccount": profileController.profile.value.id
      },
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        print('ADD TO CART SUCCESS ====>>>>> ${res.data.toString()}');
        cartController.onInit();
        cartController.update();
        Get.to(CartPage(id: idWidget), id: idWidget);
        update();
      },
      onError: (e) {
        print('ADD TO CART FAIL ====>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
