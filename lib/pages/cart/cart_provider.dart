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
}
