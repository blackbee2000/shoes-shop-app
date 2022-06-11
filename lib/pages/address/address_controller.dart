import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/district.dart';
import 'package:shoes_shop_app/models/province.dart';
import 'package:shoes_shop_app/models/ward.dart';
import 'package:shoes_shop_app/pages/address/address_provider.dart';
import 'package:shoes_shop_app/pages/payment/payment_controller.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class AddressController extends GetxController {
  final isShowAddPopup = false.obs;
  TextEditingController customerName = TextEditingController();
  TextEditingController customerPhone = TextEditingController();
  TextEditingController customerStreet = TextEditingController();
  TextEditingController customerNameEdit = TextEditingController();
  TextEditingController customerAddressEdit = TextEditingController();
  final statusSwitch = false.obs;
  List<Address> listAddress = <Address>[].obs;
  List<Province> listProvince = <Province>[].obs;
  List<District> listDistrict = <District>[].obs;
  List<Ward> listWard = <Ward>[].obs;
  final listAddressDefault = Address.fromJson({}).obs;
  final province = ''.obs;
  final district = ''.obs;
  final ward = ''.obs;
  final paymentController = Get.put(PaymentController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    getAddressDefault();
    getAllAddress();
    getProvinces();
  }

  clear() {
    customerName.clear();
    customerPhone.clear();
    customerStreet.clear();
    province.value = '';
    district.value = '';
    ward.value = '';
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
        listAddress = res.data ?? [];
        for (var e in listAddress) {
          if (e.status == true) {
            listAddress.remove(e);
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

  getAddressDefault() {
    AddressProvider().getAddressDefault(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listAddressDefault.value = res.data!;
        paymentController.addressSelected.value = res.data!;
        print(
            'LIST ADDRESSSSSS DEFAULT =>>>>> ${paymentController.addressSelected.toString()}');
        update();
      },
      onError: (e) {
        print('GET DEFAULT ADDRESS FAIL =>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getProvinces() {
    AddressProvider().getProvinces(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET DATA PROVINCE SUCESS ====> ${res.results.toString()}');
        listProvince = res.results ?? [];
        update();
      },
      onError: (e) {
        print('GET DATA PROVINCE FAIL ====> ${e.toString()}');
        update();
      },
    );
  }

  getDistricts(String provinceCode) {
    AddressProvider().getDistricts(
      params: {'province': provinceCode},
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET DATA DISTRICTS SUCESS ====> ${res.results.toString()}');
        listDistrict = res.results ?? [];
        update();
      },
      onError: (e) {
        print('GET DATA DISTRICTS FAIL ====> ${e.toString()}');
        update();
      },
    );
  }

  getWards(String districtCode) {
    AddressProvider().getWards(
      params: {'district': districtCode},
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET DATA WARDS SUCESS ====> ${res.results.toString()}');
        listWard = res.results ?? [];
        update();
      },
      onError: (e) {
        print('GET DATA WARDS FAIL ====> ${e.toString()}');
        update();
      },
    );
  }

  deleteAddress(String id) {
    AddressProvider().deleteAddress(
      id: id,
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
        init();
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
        init();
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
    bool status,
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
        init();
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
      id: id,
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
        init();
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

  chooseAddressPayment(Address address, int id) {
    paymentController.addressSelected.value = address;
    paymentController.update();
    update();
    Get.back(id: id);
  }
}
