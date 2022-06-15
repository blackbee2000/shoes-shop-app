import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/cart_response.dart';
import 'package:shoes_shop_app/models/otp_submit.dart';
import 'package:shoes_shop_app/models/product_response.dart';
import 'package:shoes_shop_app/models/rating_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class ProductAPIProtocol {
  getAllProduct({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  addToCart({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(CartResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getProductRelated({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(ProductResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  likeProduct({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OtpSubmit data) onSuccess,
    required Function(dynamic error) onError,
  });
  getRatingByAccount({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(RatingResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  updateRating({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(RatingResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  createRating({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(RatingResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ProductProvider extends ProductAPIProtocol {
  @override
  getAllProduct(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.PRODUCTBYCOMPANY,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  addToCart(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(CartResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.ADDTOCART,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(CartResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getProductRelated(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(ProductResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.PRODUCTRELATED,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProductResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  likeProduct(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OtpSubmit data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.LIKEPRODUCT,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(OtpSubmit.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getRatingByAccount(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(RatingResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.GETRATEBYACCOUNT,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(RatingResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  updateRating(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(RatingResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.UPDATERATEBYACCOUNT,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(RatingResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  createRating(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(RatingResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.CREATERATING,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(RatingResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
