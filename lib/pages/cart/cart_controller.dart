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

  logOutCart() {
    listCart = [];
    update();
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
        getAllCart();
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  minusAmount(String idCart, int amount) {
    if (amount < 1) {
      Get.snackbar(
        'warning'.tr,
        'choose_amount'.tr,
        colorText: Colors.white,
        backgroundColor: const Color(0xffe5b700),
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
        getAllCart();
        update();
      },
      onError: (e) {
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
      if (listCartSelected.isEmpty) {
        Get.snackbar(
          'warning'.tr,
          'please_choose_product'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffe5b700),
        );
      } else {
        Future.delayed(const Duration(milliseconds: 500)).then((_) {
          Get.to(PaymentPage(id: idWidget), id: idWidget);
        });
      }
    } else {
      for (var e in listCart) {
        if (e.isChecked == true) {
          listCartSelected.add(e);
        }
      }
      if (listCartSelected.isEmpty) {
        Get.snackbar(
          'warning'.tr,
          'please_choose_product'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffe5b700),
        );
      } else {
        Future.delayed(const Duration(milliseconds: 500)).then((_) {
          Get.to(PaymentPage(id: idWidget), id: idWidget);
        });
      }
    }
  }

  getAllListCartSelected() {
    selectAll.value = true;
    for (var e in listCart) {
      e.isChecked = true;
    }

    listCartSelected = listCart;
    if (listCartSelected.isEmpty) {
      Get.snackbar(
        'warning'.tr,
        'please_choose_product'.tr,
        colorText: Colors.white,
        backgroundColor: const Color(0xffe5b700),
      );
    }
    update();
  }

  deleteMultiCart() {
    if (selectAll.value == true) {
      List<String> listCartDelete = [];
      for (var e in listCart) {
        listCartDelete.add(e.id ?? '');
      }
      if (listCartDelete.isEmpty) {
        Get.snackbar(
          'warning'.tr,
          'please_choose_product'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffe5b700),
        );
      } else {
        deleteCart(listCartDelete);
      }
    } else {
      List<String> listCartDelete = [];
      for (var e in listCart) {
        if (e.isChecked == true) {
          listCartDelete.add(e.id ?? '');
        }
      }
      if (listCartDelete.isEmpty) {
        Get.snackbar(
          'warning'.tr,
          'please_choose_product'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffe5b700),
        );
      } else {
        deleteCart(listCartDelete);
      }
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
        listCartSelected.clear();
        listCartDelete.clear();
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
