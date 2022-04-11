import 'package:shoes_shop_app/library/api_request.dart';
import 'package:shoes_shop_app/models/auth.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class AuthAPIProtocol {
  login({
    required Map<String, dynamic> params,
    required Function() beforeSend,
    required Function(Auth auth) onSuccess,
    required Function(dynamic error) onError,
  });
}

class AuthProvider extends AuthAPIProtocol {
  @override
  login(
      {required Map<String, dynamic> params,
      required Function() beforeSend,
      required Function(Auth auth) onSuccess,
      required Function(dynamic error) onError}) {
    ApiRequest(
      path: ApiConstant.LOGIN,
      params: params,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        print('LOGIN ${data.toString()}');
        onSuccess(Auth.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
