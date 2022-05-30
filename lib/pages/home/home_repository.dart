import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/company_response.dart';
import 'package:shoes_shop_app/models/product_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class HomeAPIProtocol {
  getAllCompany({
    required Options option,
    required Function() beforeSend,
    required Function(CompanyResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getNewProduct({
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getDiscountProduct({
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getTrendingProduct({
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class HomeRepository extends HomeAPIProtocol {
  @override
  getAllCompany(
      {required Options option,
      required Function() beforeSend,
      required Function(CompanyResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.COMPANY,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(CompanyResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getNewProduct(
      {required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.NEWPRODUCT,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getDiscountProduct(
      {required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.DISCOUNTPRODUCT,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getTrendingProduct(
      {required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.TRENDINGPRODUCT,
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
