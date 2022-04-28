import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/blog_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class BlogAPIProtocol {
  getAllBlog({
    required Options option,
    required Function() beforeSend,
    required Function(BlogResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class BlogProvider extends BlogAPIProtocol {
  @override
  getAllBlog(
      {required Options option,
      required Function() beforeSend,
      required Function(BlogResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.BLOG,
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(BlogResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
