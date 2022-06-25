import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/shipping_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class OrderAPIProtocol {
  payment({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
  checkShipping({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(ShippingRes data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class OrderProvider extends OrderAPIProtocol {
  @override
  payment(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ORDER,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  checkShipping(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(ShippingRes data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: 'https://services.giaohangtietkiem.vn/services/shipment/fee',
      params: params,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ShippingRes.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
