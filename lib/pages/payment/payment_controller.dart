import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/paymethod.dart';
import 'package:shoes_shop_app/models/voucher.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/payment/payment_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class PaymentController extends GetxController {
  final indexSelected = 0.obs;
  final listPayMethod = <PayMethod>[].obs;
  final voucher = Voucher.fromJson({}).obs;
  final cartController = Get.put(CartController());
  final profileController = Get.put(ProfileController());
  final typePayment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() {
    listPayMethod.add(PayMethod(name: 'Pay via VNpay', type: 'VnPay'));
    listPayMethod.add(PayMethod(name: 'Pay via Paypal', type: 'Paypal'));
    listPayMethod.add(PayMethod(name: 'Pay via COD', type: 'COD'));
    update();
  }

  payment(String voucherCode, String typePayment, int totalPriceProduct,
      Address address) {
    OrderProvider().payment(
      params: {
        "lstCart": cartController.listCartSelected,
        "idAccount": profileController.profile.value.id,
        "status": 1,
        "statusPayment": false,
        "typePayment": typePayment,
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
      beforeSend: () {},
      onSuccess: (res) {
        print('THANH TOÁN THÀNH CÔNG =====> ${res.data.toString()}');
        Get.snackbar(
          'Success',
          'Payment success',
          colorText: Colors.white,
          backgroundColor: Colors.black,
        );
        update();
      },
      onError: (e) {
        print('THANH TOÁN THẤT BẠI =====> ${e.toString()}');
        Get.snackbar(
          'Fail',
          'Payment fail',
          colorText: Colors.white,
          backgroundColor: Colors.black,
        );
        update();
      },
    );
  }
}
