import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:shoes_shop_app/config/flavor_config.dart';
import 'package:shoes_shop_app/pages/auth/login/login_page.dart';
import 'package:shoes_shop_app/services/auth_service.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class ApiRequest {
  final String url = FlavorConfig.instance.values.baseUrl;
  final dynamic params;
  final String path;

  ApiRequest({
    required this.path,
    required this.params,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: _defaultConnectTimeout,
        receiveTimeout: _defaultReceiveTimeout,
        headers: AuthService.to.isTokenExisted
            ? {
                'Content-Type': 'application/json; charset=UTF-8',
                'token': AuthService.to.appToken
              }
            : {
                'Content-Type': 'application/json; charset=UTF-8',
              },
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError error, handler) {
            final errResponse = error.response;
            if (errResponse?.statusCode == 401) {
              print('errResponse ${errResponse!.requestOptions.path}');
              getx.Get.offAll(() => LoginPage());
            }
          },
        ),
      );
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio()
        .get(path, queryParameters: Map<String, dynamic>.from(params))
        .then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void post({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio().post(path, data: params).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void put({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    _dio().put(path, data: params).then((res) {
      onSuccess(res.data);
    }).printInfo(printFunction: (e) {
      print(e);
    });
  }

  void upload({
    required FormData formdata,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    beforeSend();
    _dio().post(path, data: formdata).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
