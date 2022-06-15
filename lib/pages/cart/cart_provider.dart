import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/cart_list.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class CartAPIProtocol {
  getAllCart({
    required Options option,
    required Function() beforeSend,
    required Function(CartList data) onSuccess,
    required Function(dynamic error) onError,
  });
  deleteCart({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
  updateAmounCart({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class CartProvider extends CartAPIProtocol {
  @override
  getAllCart(
      {required Options option,
      required Function() beforeSend,
      required Function(CartList data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.CART,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(CartList.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  deleteCart(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DELETECART,
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
  updateAmounCart(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.UPDATEAMOUNTCART,
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
