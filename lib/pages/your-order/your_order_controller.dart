import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/bill.dart';
import 'package:shoes_shop_app/models/tab_oder_status.dart';
import 'package:shoes_shop_app/pages/your-order/your_order_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class YourOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Bill> listOrder = <Bill>[].obs;
  final listTabOrderStatus = <TabOrderStatus>[].obs;
  final statusOrder = 1.obs;

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
      name: 'Chưa thanh toán',
      code: 1,
      image: 'assets/icons/icon-no-pay.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'Đã đóng gói',
      code: 2,
      image: 'assets/icons/icon-box-2.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'Đã giao hàng',
      code: 3,
      image: 'assets/icons/icon-shipping.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'Hoàn tất',
      code: 4,
      image: 'assets/icons/icon-done-cart.png',
    ));
    listTabOrderStatus.add(TabOrderStatus(
      name: 'Đơn đã hủy',
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
        print('GET ALL ORDER SUCESS ====> ${res.data.toString()}');
        listOrder = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET ALL ORDER FAIL ====> ${e.toString()}');
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
        print('GET ALL ORDER SUCESS ====> ${res.data.toString()}');
        listOrder = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET ALL ORDER FAIL ====> ${e.toString()}');
        update();
      },
    );
  }
}
