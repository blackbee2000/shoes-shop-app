import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/address_delete.dart';
import 'package:shoes_shop_app/models/address_response.dart';
import 'package:shoes_shop_app/models/district_response.dart';
import 'package:shoes_shop_app/models/province_response.dart';
import 'package:shoes_shop_app/models/ward_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class AddressAPIProtocol {
  getAllAddress({
    required Options option,
    required Function() beforeSend,
    required Function(AddressResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getAddressDefault({
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
    required Function(dynamic error) onError,
  });
  deleteAddress({
    required String id,
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
    required Function(dynamic error) onError,
  });
  createAddress({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
    required Function(dynamic error) onError,
  });
  updateAddress({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
    required Function(dynamic error) onError,
  });
  updateDefaultAddress({
    required String id,
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
    required Function(dynamic error) onError,
  });
  getProvinces({
    required Options option,
    required Function() beforeSend,
    required Function(ProvinceResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getDistricts({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(DistrictResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getWards({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(WardResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class AddressProvider extends AddressAPIProtocol {
  @override
  getAllAddress(
      {required Options option,
      required Function() beforeSend,
      required Function(AddressResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ADDRESS,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  deleteAddress(
      {required String id,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DELETEADDRESS + id,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressDelete.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  createAddress(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.CREATEADDRESS,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressDelete.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  updateAddress(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.UPDATEADDRESS,
      params: params,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressDelete.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  updateDefaultAddress(
      {required String id,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.UPDATEDEFAULT + id,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressDelete.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getProvinces(
      {required Options option,
      required Function() beforeSend,
      required Function(ProvinceResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.PROVINCE,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProvinceResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getDistricts(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(DistrictResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DISTRICT,
      params: params,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(DistrictResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getWards(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(WardResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.WARD,
      params: params,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(WardResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getAddressDefault(
      {required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ADDRESSDEFAULT,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressDelete.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
