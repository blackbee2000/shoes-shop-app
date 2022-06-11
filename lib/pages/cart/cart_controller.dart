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
        print('GET DATA ALL CART SUCESSS =>>>>>> ${listCart.first.isChecked}');
        update();
      },
      onError: (e) {
        print('GET DATA ALL CART =>>>>>> ${e.toString()}');
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
      print('LIST DELETE ==> ${listCartDelete.toString()}');
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
      beforeSend: () {},
      onSuccess: (data) {
        Get.snackbar(
          'Success',
          'Delete success',
          colorText: Colors.white,
          backgroundColor: Colors.black,
        );
        getAllCart();
        update();
      },
      onError: (e) {
        print('DELETE CART FAIL ====> ${e.toString()}');
        Get.snackbar(
          'Success',
          'Delete fail',
          colorText: Colors.white,
          backgroundColor: Colors.black,
        );
      },
    );
  }
}
