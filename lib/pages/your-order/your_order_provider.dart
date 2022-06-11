import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/order_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class BillAPIProtocol {
  getAllOrder({
    required Options option,
    required Function() beforeSend,
    required Function(OrderResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getOrderStatus({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OrderResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  updateStatusOrder({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class BillProvider extends BillAPIProtocol {
  @override
  getAllOrder(
      {required Options option,
      required Function() beforeSend,
      required Function(OrderResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ORDERGETALL,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(OrderResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getOrderStatus(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OrderResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ORDERBYSTATUS,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(OrderResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  updateStatusOrder(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ORDERUPDATESTATUS,
      params: params,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (error) => {onError(error)},
    );
  }
}
