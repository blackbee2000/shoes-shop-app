import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_provider.dart';

class BlogDetailController extends GetxController {
  List<Blog> listBlogDifferent = <Blog>[].obs;
  final blogDetail = Blog.fromJson({}).obs;
  @override
  void onInit() async {
    super.onInit();
  }

  getAllBlogDifferent(String idBlog) {
    BlogProvider().getAllBlogDifferent(
      params: {'getId': idBlog},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listBlogDifferent = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
