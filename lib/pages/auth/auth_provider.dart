import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/auth.dart';
import 'package:shoes_shop_app/models/otp_response.dart';
import 'package:shoes_shop_app/models/otp_submit.dart';
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
  sendOtp({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OtpResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  submitOtp({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OtpSubmit data) onSuccess,
    required Function(dynamic error) onError,
  });
  resetPassword({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(OtpSubmit data) onSuccess,
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

  @override
  sendOtp(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OtpResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.SENDOTP,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(OtpResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  submitOtp(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OtpSubmit data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.SUBMITOTP,
      params: params,
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
  resetPassword(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(OtpSubmit data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.RESETPASSWORD,
      params: params,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(OtpSubmit.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
