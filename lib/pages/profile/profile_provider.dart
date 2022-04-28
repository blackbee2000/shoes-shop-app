import 'package:dio/dio.dart';
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
}
