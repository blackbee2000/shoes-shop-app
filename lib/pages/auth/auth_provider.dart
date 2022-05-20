import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/auth.dart';
import 'package:shoes_shop_app/models/profile_response.dart';
import 'package:shoes_shop_app/models/register_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class AuthAPIProtocol {
  login({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(Auth data) onSuccess,
    required Function(dynamic error) onError,
  });
  register({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(RegisterResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class AuthProvider extends AuthAPIProtocol {
  @override
  login(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(Auth data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.LOGIN,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(Auth.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  register(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(RegisterResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.REGISTER,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(RegisterResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
