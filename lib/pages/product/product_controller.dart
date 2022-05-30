import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_repository.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';

class ProductController extends GetxController {
  List<Product> listProduct = <Product>[].obs;
  List<Company> listCompany = <Company>[].obs;
  final nameBrand = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  init() {
    getAllProduct();
    getAllCompany();
  }

  getAllCompany() {
    HomeRepository().getAllCompany(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listCompany = res.data ?? [];
        nameBrand.value = listCompany.first.nameCompany ?? '';
        print('SUCESSSSSSSS ======>>>>>> ${listCompany.toString()}');
      },
      onError: (e) {
        print('FAILLL =>>>>>>>> ${e.toString()}');
      },
    );
  }

  getAllProduct() {
    ProductProvider().getAllProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listProduct = res.data ?? [];
        // listProduct.map((e) => e.isLike = false);
        for (int i = 0; i < listProduct.length; i++) {
          listProduct[i].isLike = false;
        }
        print('SUCESSSSSS =>>>>>>> ${listProduct.first.isLike}');
        update();
      },
      onError: (e) {
        print('FAIL ==>>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
