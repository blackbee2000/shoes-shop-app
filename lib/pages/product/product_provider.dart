import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/product_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class ProductAPIProtocol {
  getAllProduct({
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ProductProvider extends ProductAPIProtocol {
  @override
  getAllProduct(
      {required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.PRODUCT,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
