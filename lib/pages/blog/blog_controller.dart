import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_provider.dart';

class BlogController extends GetxController {
  List<Blog> listBlog = <Blog>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getAllBlog();
  }

  getAllBlog() {
    BlogProvider().getAllBlog(
      params: {"limit": 5, "skip": 1},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listBlog = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
