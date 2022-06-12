import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/order.dart';
import 'package:shoes_shop_app/models/tab_oder_status.dart';
import 'package:shoes_shop_app/pages/your-order/your_order_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class YourOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Order> listOrder = <Order>[].obs;
  final listTabOrderStatus = <TabOrderStatus>[].obs;
  final statusOrder = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    fetchData();
    getOrderStatus(1);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  fetchData() {
    listTabOrderStatus.add(TabOrderStatus(
      name: 'new_order'.tr,
      code: 1,
      image: 'assets/icons/icon-no-pay.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'packed'.tr,
      code: 2,
      image: 'assets/icons/icon-box-2.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'shipping'.tr,
      code: 3,
      image: 'assets/icons/icon-shipping.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'done'.tr,
      code: 4,
      image: 'assets/icons/icon-done-cart.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'cancel_order'.tr,
      code: 5,
      image: 'assets/icons/icon-cancel.png',
    ));
    update();
  }

  getAllOrder() {
    BillProvider().getAllOrder(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listOrder = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getOrderStatus(int status) {
    BillProvider().getOrderStatus(
      params: {"status": status},
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listOrder = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  cancelOrder(String idOrder) {
    BillProvider().updateStatusOrder(
        params: {"_id": idOrder, "status": 5},
        option: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${ApiToken.to.appToken}',
          },
        ),
        beforeSend: () {},
        onSuccess: (data) {
          Get.snackbar(
            'success'.tr,
            'cancel_order_success'.tr,
            colorText: Colors.white,
            backgroundColor: Colors.black,
          );
          getOrderStatus(1);
          update();
        },
        onError: (e) {
          Get.snackbar(
            'fail',
            'cancel_order_fail'.tr,
            colorText: Colors.white,
            backgroundColor: Colors.black,
          );
          update();
        });
  }
}
