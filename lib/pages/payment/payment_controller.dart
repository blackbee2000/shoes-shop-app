import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/paymethod.dart';
import 'package:shoes_shop_app/models/voucher.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/payment/payment_provider.dart';
import 'package:shoes_shop_app/pages/payment/web_payment.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/utils/utils.dart';

class PaymentController extends GetxController {
  final indexSelected = 4.obs;
  final listPayMethod = <PayMethod>[].obs;
  final voucher = Voucher.fromJson({}).obs;
  final cartController = Get.put(CartController());
  final profileController = Get.put(ProfileController());
  final typePayment = ''.obs;
  final addressSelected = Address.fromJson({}).obs;
  final shippingMoney = 0.obs;
  final urlPayment = "".obs;
  final returnURL = "".obs;
  final cancelURL = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    clearData();
  }

  clearData() {
    typePayment.value = '';
    voucher.value = Voucher.fromJson({});
    addressSelected.value = Address.fromJson({});
    returnURL.value = "";
    cancelURL.value = "";
    indexSelected.value = 4;
  }

  fetchData() {
    listPayMethod.add(PayMethod(name: 'Pay via VNpay', type: 'VnPay'));
    listPayMethod.add(PayMethod(name: 'Pay via Paypal', type: 'Paypal'));
    listPayMethod.add(PayMethod(name: 'Pay via COD', type: 'COD'));
    update();
  }

  payment(String voucherCode, String typePaymentMethod, int totalPriceProduct,
      Address address, BuildContext context) {
    OrderProvider().payment(
      params: {
        "lstCart": cartController.listCartSelected,
        "idAccount": profileController.profile.value.id,
        "status": 1,
        "typePayment": typePaymentMethod,
        "statusPayment": false,
        "voucher": voucherCode,
        "totalShipping": 12000,
        "totalPriceProduct": totalPriceProduct,
        "address": address,
      },
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
        if (typePaymentMethod == 'COD') {
          Get.offAll(const DashboardPage());
          Get.snackbar(
            'success'.tr,
            'payment_success'.tr,
            colorText: Colors.white,
            backgroundColor: const Color(0xff00FF00),
          );
        } else {
          if (typePaymentMethod == 'Paypal') {
            returnURL.value =
                'https://lt-shoes-shop.herokuapp.com/api/order/success';
            cancelURL.value =
                'https://lt-shoes-shop.herokuapp.com/api/order/cancel';
            update();
          } else {
            returnURL.value =
                'https://lt-shoes-shop.herokuapp.com/api/order/successVnPay';
            cancelURL.value =
                'https://lt-shoes-shop.herokuapp.com/api/order/cancel';
            update();
          }
          urlPayment.value = data['data'];
          update();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WebPayment()));
          // Get.back();
          // launchInWebViewOrVC(Uri.parse(url));
        }
        voucher.value = Voucher.fromJson({});
        typePayment.value = '';
        cartController.listCartSelected.clear();
        cartController.onInit();
        cartController.update();
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'payment_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }

  getShipFee(
      {required String street,
      required String ward,
      required String province,
      required String district}) {
    OrderProvider().checkShipping(
        params: {
          "address": street + ',' + ward + ',' + district,
          "province": province,
          "district": district,
          "pick_province": 'Hồ Chí Minh',
          "pick_district": 'Thủ Đức',
          "weight": 5,
        },
        option: Options(
          headers: {
            'Token': '83b5796301Fc00A131eb690fA9d8B9B5cCf0497b',
          },
        ),
        beforeSend: () {},
        onSuccess: (res) {
          print('RESSSS ===> ${res.toString()}');
          print(res.fee!.fee!);
          shippingMoney.value = res.fee!.fee!;
          update();
        },
        onError: (e) {
          print('Fail ===> ${e.toString()}');
          update();
        });
  }
}
