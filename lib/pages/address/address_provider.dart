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
    required String id,
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
      {required String id,
      required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(AddressDelete data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DELETEADDRESS + id,
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
