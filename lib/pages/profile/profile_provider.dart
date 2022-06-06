import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/product_favorite.dart';
import 'package:shoes_shop_app/models/product_response.dart';
import 'package:shoes_shop_app/models/profile_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class ProfileAPIProtocol {
  getProfile({
    required Options option,
    required Function() beforeSend,
    required Function(ProfileResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getListProductFavorite({
    required Options option,
    required Function() beforeSend,
    required Function(ProductFavorite data) onSuccess,
    required Function(dynamic error) onError,
  });
  getAllProduct({
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ProfileProvider extends ProfileAPIProtocol {
  @override
  getProfile(
      {required Options option,
      required Function() beforeSend,
      required Function(ProfileResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.PROFILE,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProfileResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getListProductFavorite(
      {required Options option,
      required Function() beforeSend,
      required Function(ProductFavorite data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.PRODUCTFAVORITE,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductFavorite.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

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
