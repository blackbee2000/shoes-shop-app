import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/voucher_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class VoucherAPIProtocol {
  getAllVoucher({
    required Options option,
    required Function() beforeSend,
    required Function(VoucherResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class VoucherProvider extends VoucherAPIProtocol {
  @override
  getAllVoucher(
      {required Options option,
      required Function() beforeSend,
      required Function(VoucherResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.VOUCHER,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(VoucherResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
