import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/address_delete.dart';
import 'package:shoes_shop_app/models/address_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class AddressAPIProtocol {
  getAllAddress({
    required Options option,
    required Function() beforeSend,
    required Function(AddressResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  deleteAddress({
    required Map<String, dynamic> params,
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
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(AddressDelete data) onSuccess,
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
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DELETEADDRESS,
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
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.UPDATEDEFAULT,
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
}
