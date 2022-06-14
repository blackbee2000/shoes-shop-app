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
        update();
      },
      onError: (e) {
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
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getProvinces() {
    AddressProvider().getProvinces(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listProvince = res.results ?? [];
        update();
      },
      onError: (e) {
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
        listDistrict = res.results ?? [];
        update();
      },
      onError: (e) {
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
        listWard = res.results ?? [];
        update();
      },
      onError: (e) {
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
        Get.snackbar(
          'success'.tr,
          'delete_address_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'delete_address_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
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
        Get.snackbar(
          'success'.tr,
          'add_address_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'add_address_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
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
        Get.snackbar(
          'success'.tr,
          'update_address_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'update_address_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
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
        Get.snackbar(
          'fail'.tr,
          'set_address_default_success'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xff00FF00),
        );
        update();
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          'fail'.tr,
          'set_address_default_fail'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
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
