import 'package:dio/dio.dart';

class ApiService {
  late final dynamic params;
  late final dynamic path;
  late final Options option;

  ApiService({this.params, this.path, required this.option});

  Dio dio = Dio();

  void getAll({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    dio.get(path, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    dio
        .get(path,
            queryParameters: Map<String, dynamic>.from(params), options: option)
        .then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void post({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    print('PARAMS ===> $path');
    print('PARAMS ===> $params');
    dio.post(path, data: params, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void put({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    print('PATH ===> $path');
    dio.put(path, data: params, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }
}
