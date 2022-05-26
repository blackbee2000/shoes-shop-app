import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';

class ProductController extends GetxController {
  List<Product> listProduct = <Product>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getAllProduct();
  }

  getAllProduct() {
    ProductProvider().getAllProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listProduct = res.data ?? [];
        print('LEGNTTTTTTTT ${res.data!.length}');
        print('SUCESSSSSS =>>>>>>> ${res.data.toString()}');
        update();
      },
      onError: (e) {
        print('FAIL ==>>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
