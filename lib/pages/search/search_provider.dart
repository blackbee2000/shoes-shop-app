import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/product_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class SearchAPIProtocol {
  searchProduct({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class SearchProvider extends SearchAPIProtocol {
  @override
  searchProduct(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.SEARCHPRODUCT,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
