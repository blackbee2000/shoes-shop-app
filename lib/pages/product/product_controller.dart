import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';

class ProductController extends GetxController {
  List<Product> listProduct = <Product>[].obs;
  List<Company> listCompany = <Company>[].obs;
  final nameBrand = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    getAllCompany();
  }

  getAllCompany() {
    HomeProvider().getAllCompany(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listCompany = res.data ?? [];
        nameBrand.value = listCompany.first.nameCompany ?? '';
        getAllProduct(listCompany.first.id!);
        print(
            'SUCESSSSSSSS COMPANY IN PRODUCT ======>>>>>> ${listCompany.first.id.toString()}');
        update();
      },
      onError: (e) {
        print('FAILLL =>>>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getAllProduct(String idCompany) {
    ProductProvider().getAllProduct(
      params: {"idCompany": idCompany, "skip": 2, "limit": 5},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProduct = res.data ?? [];
        for (int i = 0; i < listProduct.length; i++) {
          listProduct[i].isLike = false;
        }
        print('GET PRODUCT SUCESSSSSS =>>>>>>> ${listProduct.first.isLike}');
        update();
      },
      onError: (e) {
        print('GET PRODUCT FAIL ==>>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
