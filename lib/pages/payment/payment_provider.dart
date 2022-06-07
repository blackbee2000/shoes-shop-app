import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/order_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class OrderAPIProtocol {
  payment({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OrderResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class OrderProvider extends OrderAPIProtocol {
  @override
  payment(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OrderResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.ORDER,
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
}
