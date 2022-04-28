import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/company_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class HomeAPIProtocol {
  getAllCompany({
    required Options option,
    required Function() beforeSend,
    required Function(CompanyResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class HomeProvider extends HomeAPIProtocol {
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
}
