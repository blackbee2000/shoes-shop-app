import 'package:dio/dio.dart';
import 'package:shoes_shop_app/models/blog_response.dart';
import 'package:shoes_shop_app/services/api_service.dart';
import 'package:shoes_shop_app/utils/api_constant.dart';

abstract class BlogAPIProtocol {
  getAllBlog({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(BlogResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
  getAllBlogDifferent({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(BlogResponse data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class BlogProvider extends BlogAPIProtocol {
  @override
  getAllBlog(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(BlogResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.BLOG,
      params: params,
      option: option,
    ).post(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(BlogResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getAllBlogDifferent(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(BlogResponse data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: ApiConstant.BLOGDIFFERENT,
      params: params,
      option: option,
    ).get(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(BlogResponse.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}
