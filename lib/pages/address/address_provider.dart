import 'package:dio/dio.dart';
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
  getDefaultAddress(
      {required Options option,
      required Function() beforeSend,
      required Function(AddressResponse data) onSuccess,
      required Function(dynamic error) onError});
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
  getDefaultAddress(
      {required Options option,
      required Function() beforeSend,
      required Function(AddressResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ADDRESSDEFAULT,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(AddressResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
