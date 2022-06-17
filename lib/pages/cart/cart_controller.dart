import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/cart.dart';
import 'package:shoes_shop_app/pages/cart/cart_provider.dart';
import 'package:shoes_shop_app/pages/payment/payment_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class CartController extends GetxController {
  final indexSelected = 0.obs;
  List<Cart> listCart = <Cart>[].obs;
  List<Cart> listCartSelected = <Cart>[].obs;
  final selectAll = false.obs;

  final addressPayment = Address.fromJson({}).obs;

  @override
  void onInit() async {
    super.onInit();
    getAllCart();
  }

  plusAmount(String idCart, int amount) {
    amount = amount + 1;
    CartProvider().updateAmounCart(
      params: {"_id": idCart, "amount": amount},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (data) {
        print('SUCESSSS ==> ${data.toString()}');
        getAllCart();
        update();
      },
      onError: (e) {
        print('FAILLL ==> ${e.toString()}');
        update();
      },
    );
  }

  minusAmount(String idCart, int amount) {
    if (amount < 1) {
      Get.snackbar(
        'warning'.tr,
        ''.tr,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
      return;
    }
    amount = amount - 1;
    CartProvider().updateAmounCart(
      params: {"_id": idCart, "amount": amount},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (data) {
        print('SUCESSSS ==> ${data.toString()}');
        getAllCart();
        update();
      },
      onError: (e) {
        print('FAILLL ==> ${e.toString()}');
        update();
      },
    );
  }

  getAllCart() {
    CartProvider().getAllCart(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listCart = res.data ?? [];
        for (var e in listCart) {
          e.isChecked = false;
        }
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getListCartSelected(idWidget) {
    if (selectAll.value == true) {
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        Get.to(PaymentPage(id: idWidget), id: idWidget);
      });
    } else {
      for (var e in listCart) {
        if (e.isChecked == true) {
          listCartSelected.add(e);
        }
      }
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        Get.to(PaymentPage(id: idWidget), id: idWidget);
      });
    }
  }

  getAllListCartSelected() {
    selectAll.value = true;
    for (var e in listCart) {
      e.isChecked = true;
    }

    listCartSelected = listCart;
    update();
  }

  deleteMultiCart() {
    if (selectAll.value == true) {
      List<String> listCartDelete = [];
      for (var e in listCart) {
        listCartDelete.add(e.id ?? '');
      }
      deleteCart(listCartDelete);
    } else {
      List<String> listCartDelete = [];
      for (var e in listCart) {
        if (e.isChecked == true) {
          listCartDelete.add(e.id ?? '');
        }
      }
      deleteCart(listCartDelete);
    }
  }

  deleteCart(List<String> listCartDelete) {
    CartProvider().deleteCart(
      params: {"lstCartId": listCartDelete},
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
      onSuccess: (data) {
        Get.back();
        Get.snackbar(
          'success'.tr,
          'delete_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        getAllCart();
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'delete_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
      },
    );
  }
}
