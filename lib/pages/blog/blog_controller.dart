import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shoes_shop_app/models/blog.dart';
import 'package:shoes_shop_app/pages/blog/blog_provider.dart';

class BlogController extends GetxController {
  final limit = 20;
  final skip = 1.obs;
  List<Blog> listBlog = <Blog>[].obs;
  final PagingController<int, Blog> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getAllBlog(pageKey);
    });
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  getAllBlog(int pageKey) {
    BlogProvider().getAllBlog(
      params: {"limit": limit, "skip": 1},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listBlog = res.data ?? [];
        skip.value = skip.value + 1;
        try {
          final isLastPage = listBlog.length < limit;
          if (isLastPage) {
            pagingController.appendLastPage(listBlog);
          } else {
            final nextPageKey = pageKey + listBlog.length;
            pagingController.appendPage(listBlog, nextPageKey);
          }
        } catch (error) {
          pagingController.error = error;
        }
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
