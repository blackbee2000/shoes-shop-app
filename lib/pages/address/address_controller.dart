import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final isShowAddPopup = false.obs;
  final isShowEditPopup = false.obs;
  final isShowDeletePopup = false.obs;
  TextEditingController customerName = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController customerNameEdit = TextEditingController();
  TextEditingController customerAddressEdit = TextEditingController();
  final statusSwitch = false.obs;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    customerNameEdit.text = 'Phạm Thành Trung';
    customerAddressEdit.text = '180 Sao Hoả, Hệ Mặt Trời';
  }
}
