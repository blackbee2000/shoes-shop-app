import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_provider.dart';

class BlogController extends GetxController {
  List<Blog> listBlog = <Blog>[].obs;

  @override
  void onInit() async {
    super.onInit();

  }

  getAllBlog() {
    BlogProvider().getAllBlog(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET DATA BLOG SUCESSS =>>>>>> ${res.toString()}');
        listBlog = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET DATA BLOG FAIL =>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
