import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/paymethod.dart';
import 'package:shoes_shop_app/models/voucher.dart';
import 'package:shoes_shop_app/pages/cart/cart_controller.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/payment/payment_provider.dart';
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
        "typePayment": typePayment,
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
        if (typePayment == 'COD') {
          Get.back();
          Get.offAll(const DashboardPage());
          Get.snackbar(
            'success'.tr,
            'payment_success'.tr,
            colorText: Colors.white,
            backgroundColor: Colors.black,
          );
        } else {
          var url = data['data'];
          launchInWebViewOrVC(Uri.parse(url));
        }

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
          backgroundColor: Colors.black,
        );
        update();
      },
    );
  }
}
