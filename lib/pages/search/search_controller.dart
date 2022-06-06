import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/search/search_provider.dart';

class SearchController extends GetxController {
  final sortSelected = ''.obs;
  TextEditingController shoeName = TextEditingController();
  final idCompany = ''.obs;
  final nameCompany = Company.fromJson({}).obs;
  final showClearButton = false.obs;

  List<Company> listCompany = <Company>[].obs;
  List<Product> listProductSearch = <Product>[].obs;
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
        print(
            'SUCESSSSSSSS COMPANY IN PRODUCT ======>>>>>> ${listCompany.toString()}');
        update();
      },
      onError: (e) {
        print('FAILLL =>>>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  search(String name, String idCompany) {
    SearchProvider().searchProduct(
      params: {
        "nameProductVi": name,
        "idCompany": idCompany,
        "limit": 10,
        "skip": 1
      },
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {
        Get.dialog(
          const SizedBox(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          barrierDismissible: false,
        );
      },
      onSuccess: (res) {
        listProductSearch = res.data ?? [];
        print('SEARCH SUCCESS =======> ${listProductSearch.toString()}');
        Get.back();
        update();
      },
      onError: (e) {
        print('SEARCH FAIL ====> ${e.toString()}');
        Get.back();
        update();
      },
    );
  }

  sortProductSearch(List<Product> productList, String type) {
    switch (type) {
      case 'price':
        productList.sort((a, b) {
          return b.price!.compareTo(a.price!);
        });
        break;
      case 'name':
        productList.sort((a, b) {
          if (a.nameProductVi != null && b.nameProductVi != null) {
            return b.nameProductVi!.compareTo(a.nameProductVi!);
          }
          return 1;
        });
        break;
    }
    update();
  }
}
