import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/pages/address/address_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class AddressController extends GetxController {
  final isShowAddPopup = false.obs;
  TextEditingController customerName = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController customerNameEdit = TextEditingController();
  TextEditingController customerAddressEdit = TextEditingController();
  final statusSwitch = false.obs;
  List<Address> listAddress = <Address>[].obs;
  final listAddressDefault = Address.fromJson({}).obs;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getAllAddress();
  }

  getAllAddress() {
    AddressProvider().getAllAddress(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET ALL ADDRESS SUCCESS =>>>>> ${res.data.toString()}');
        listAddress = res.data ?? [];
        for (var e in listAddress) {
          if (e.status == true) {
            listAddressDefault.value = e;
            return;
          }
        }
        print('LIST ADDRESSSSSS =>>>>> ${listAddress.toString()}');
        update();
      },
      onError: (e) {
        print('GET ALL ADDRESS FAIL =>>>>> ${e.toString()}');
        update();
      },
    );
  }

  deleteAddress(String id) {
    AddressProvider().deleteAddress(
      params: {
        'getId': id,
      },
      option: Options(
        headers: {
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
      onSuccess: (res) {
        Get.back();
        print('DELETE ADDRES SUCESS ${res.data.toString()}');
        update();
      },
      onError: (e) {
        Get.back();
        print('DELETE ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }

  createAddress(
    String province,
    String district,
    String ward,
    String street,
    String nameReceiever,
    String phoneReciever,
  ) {
    AddressProvider().createAddress(
      params: {
        "province": province,
        "district": district,
        "ward": ward,
        "street": street,
        "status": false,
        "nameReciever": nameReceiever,
        "phoneReciever": phoneReciever
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
      onSuccess: (res) {
        Get.back();
        print('CREATE ADDRES SUCESS ${res.data.toString()}');
        update();
      },
      onError: (e) {
        Get.back();
        print('CREATE ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }

  updateAddress(
    String id,
    String province,
    String district,
    String ward,
    String street,
    String status,
    String nameReceiever,
    String phoneReciever,
  ) {
    AddressProvider().updateAddress(
      params: {
        "_id": id,
        "province": province,
        "district": district,
        "ward": ward,
        "street": street,
        "status": status,
        "nameReciever": nameReceiever,
        "phoneReciever": phoneReciever
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
      onSuccess: (res) {
        Get.back();
        print('UPDATE ADDRES SUCESS ${res.data.toString()}');
        update();
      },
      onError: (e) {
        Get.back();
        print('UPDATE ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }

  updateDefaultAddress(
    String id,
  ) {
    AddressProvider().updateDefaultAddress(
      params: {
        'getId': id,
      },
      option: Options(
        headers: {
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
      onSuccess: (res) {
        Get.back();
        print('UPDATE DEFAULT ADDRES SUCESS ${res.data.toString()}');
        update();
      },
      onError: (e) {
        Get.back();
        print('UPDATE DEFAULT ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }
}
