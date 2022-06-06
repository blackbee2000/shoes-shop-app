import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/address_detail.dart';
import 'package:shoes_shop_app/pages/address/address_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

import '../../config/address_local.dart';

class AddressController extends GetxController {
  final isShowAddPopup = false.obs;
  TextEditingController customerName = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController customerNameEdit = TextEditingController();
  TextEditingController customerAddressEdit = TextEditingController();
  final statusSwitch = false.obs;
  List<Address> listAddress = <Address>[].obs;
  List<Province> lstProvince = <Province>[].obs;
  List<District> lstDistrict = <District>[].obs;
  List<Ward> lstWard = <Ward>[].obs;
  final addressDefault = Address.fromJson({}).obs;

  @override
  void onInit() {
    super.onInit();
    getProvince();
    getAllAddress();
    customerNameEdit.text = 'Phạm Thành Trung';
    customerAddressEdit.text = '180 Sao Hoả, Hệ Mặt Trời';
  }

  getProvince() {
    const data = provinceJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    data.forEach((key, value) {
      lstProvince.add(Province(id: key, name: value['name']!));
    });
    update();
  }

  getDistrict(String id) {
    const data = districtJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    data.forEach((key, value) {
      if (id == value['parent_code']) {
        lstDistrict.add(District(id: key, name: value['name']!, idParent: id));
      }
    });
    update();
  }

  getWard(String id) {
    const data = wardJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    data.forEach((key, value) {
      if (id == value['parent_code']) {
        lstWard.add(Ward(id: key, name: value['name']!, idParent: id));
      }
    });
    update();
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
            addressDefault.value = e;
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
      id: id,
      params: {},
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

  // getDefaultAddress() {
  //   AddressProvider().getDefaultAddress(
  //     option: Options(
  //       headers: {
  //         'Authorization': 'Bearer ${ApiToken.to.appToken}',
  //       },
  //     ),
  //     beforeSend: () {},
  //     onSuccess: (res) {
  //       print('GET ADDRESS DEFAULT SUCCESS =>>>>> ${res.data.toString()}');
  //       addressDefault.value = res.data![0];
  //       print('ADDRESS DEFAULT  =>>>>> ${addressDefault.toString()}');
  //       update();
  //     },
  //     onError: (e) {
  //       print('GET ADDRESS DEFAULT FAIL =>>>>> ${e.toString()}');
  //     },
  //   );
  // }
}
