import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/profile_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class ChangePasswordAPIProtocol {
  changePassword({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(ProfileResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ChangePasswordProvider extends ChangePasswordAPIProtocol {
  @override
  changePassword(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(ProfileResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      params: params,
      path: ApiConstant.CHANGEPASSWORD,
      option: option,
    ).put(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(ProfileResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
