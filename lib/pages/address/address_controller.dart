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
  //Add
  TextEditingController customerName = TextEditingController();
  TextEditingController customerPhoneNumber = TextEditingController();
  TextEditingController customerStreet = TextEditingController();
  final customerProvince = Province(id: '', name: '').obs;
  final customerDistrict = District(id: '', idParent: '', name: '').obs;
  final customerWard = Ward(id: '', idParent: '', name: '').obs;
  //Edit
  final statusSwitch = false.obs;
  //List
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
    print(addressDefault.value.id);
  }

  setDefaultInitData() {
    customerName.text = "";
    customerPhoneNumber.text = "";
    customerStreet.text = "";
    getProvince();
    // update();
  }

  setValueEdit(Address address) {
    customerProvince.value.name = address.province!;
    customerDistrict.value.name = address.district!;
    customerWard.value.name = address.ward!;
    customerName.text = address.nameReciever!;
    customerPhoneNumber.text = address.phoneReciever!;
    customerStreet.text = address.street!;
    statusSwitch.value = address.status!;
    update();
  }

  getProvince() {
    const data = provinceJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    List<Province> lst = [];
    data.forEach((key, value) {
      lst.add(Province(id: key, name: value['name_with_type']!));
    });
    lstProvince = lst;
    customerProvince.value = lstProvince[0];
    getDistrict(customerProvince.value.id);
    getWard(customerDistrict.value.id);
    update();
  }

  getDistrict(String id) {
    const data = districtJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    if (id != null) {
      List<District> lst = [];
      data.forEach((key, value) {
        // print(id + '<>' + value['parent_code']!);
        if (id == value['parent_code']) {
          lst.add(
              District(id: key, name: value['name_with_type']!, idParent: id));
        }
      });
      lstDistrict = lst;
      customerDistrict.value = lstDistrict[0];
      getWard(customerDistrict.value.id);
      update();
    }
  }

  getWard(String id) {
    const data = wardJson;
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return [];
    }
    List<Ward> lst = [];
    data.forEach((key, value) {
      if (id == value['parent_code']) {
        lst.add(Ward(id: key, name: value['name_with_type']!, idParent: id));
      }
    });
    lstWard = lst;
    customerWard.value = lstWard[0];
    update();
  }

  createAddress(AddressRequest address) {
    AddressProvider().createAddress(
        params: address.toJson(),
        option: Options(headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        }),
        beforeSend: () {},
        onSuccess: (res) {
          print('GET ALL ADDRESS SUCCESS =>>>>> ${res.data.toString()}');
          listAddress.add(res.data);
          update();
        },
        onError: (er) {
          print('GET ALL ADDRESS FAIL =>>>>> ${er.toString()}');
        });
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
            listAddress.remove(e);
            update();
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

  updateAddress(Address address) {
    AddressProvider().updateAddress(
      id: "",
      params: address.toJson(),
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
        if (address.id == addressDefault.value.id) {
          addressDefault.value = address;
          if (address.status == false) {
            listAddress.add(addressDefault.value);
            addressDefault.value = Address.fromJson({});
          }
        } else {
          if (address.status == true) {
            updateStatusDefault(address.id!);
          } else {
            final index =
                listAddress.indexWhere((element) => element.id == address.id);
            if (index != -1) {
              listAddress[index] = address;
            }
          }
        }
        Get.back();
        Get.back();
        update();

        print('DELETE ADDRES SUCESS ${res.data.toString()}');
      },
      onError: (e) {
        Get.back();
        print('DELETE ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }

  updateStatusDefault(String id) {
    AddressProvider().updateStatusDefault(
      id: id,
      params: {},
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        if (addressDefault.value != null && addressDefault.value.id != null) {
          addressDefault.value.status = false;
          listAddress.add(addressDefault.value);
        }
        final index = listAddress.indexWhere((value) => value.id == id);
        listAddress[index].status = true;
        final addressDf = listAddress[index];
        listAddress.removeAt(index);
        addressDefault.value = addressDf;
        update();

        print('DELETE ADDRES SUCESS ${res.data.toString()}');
      },
      onError: (e) {
        Get.back();
        print('DELETE ADDRES FAIL ${e.toString()}');
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
        if (id == addressDefault.value.id) {
          addressDefault.value = Address.fromJson({});
        } else {
          final index = listAddress.indexWhere((element) => element.id == id);
          if (index != -1) {
            listAddress.removeAt(index);
          }
        }
        Get.back();
        Get.back();
        update();

        print('DELETE ADDRES SUCESS ${res.data.toString()}');
      },
      onError: (e) {
        Get.back();
        print('DELETE ADDRES FAIL ${e.toString()}');
        update();
      },
    );
  }

  getDefaultAddress() {
    AddressProvider().getDefaultAddress(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET ADDRESS DEFAULT SUCCESS =>>>>> ${res.data.toString()}');
        addressDefault.value = res.data![0];
        print('ADDRESS DEFAULT  =>>>>> ${addressDefault.toString()}');
        update();
      },
      onError: (e) {
        print('GET ADDRESS DEFAULT FAIL =>>>>> ${e.toString()}');
      },
    );
  }
}
