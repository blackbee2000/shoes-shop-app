import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/pages/search/search_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class SearchController extends GetxController {
  final sortSelected = ''.obs;
  TextEditingController shoeName = TextEditingController();
  final idCompany = ''.obs;
  final nameCompany = Company.fromJson({}).obs;
  final showClearButton = false.obs;

  List<Company> listCompany = <Company>[].obs;
  List<Product> listProductSearch = <Product>[].obs;
  List<String> listProductFavorite = <String>[].obs;
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
        update();
      },
      onError: (e) {
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
        for (var e in listProductSearch) {
          e.isLike = false;
        }
        if (ApiToken.to.isTokenExisted == true) {
          getListProductFavorite(listProductSearch);
        }
        Get.back();
        update();
      },
      onError: (e) {
        Get.back();
        update();
      },
    );
  }

  getListProductFavorite(List<Product> productList) {
    ProfileProvider().getListProductFavorite(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProductFavorite = res.data ?? [];

        for (var x in productList) {
          for (var k in listProductFavorite) {
            if (k == x.id) {
              x.isLike = true;
            }
          }
        }
        update();
      },
      onError: (e) {
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

  likeProduct(String id, bool isLike) {
    ProductProvider().likeProduct(
      params: {"idProduct": id},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        if (isLike == false) {
          Get.snackbar(
            'success'.tr,
            'product_liked',
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        } else {
          Get.snackbar(
            'Success',
            'Đã hủy thích sản phẩm',
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }

        for (var e in listProductSearch) {
          if (id == e.id) {
            e.isLike = !e.isLike!;
          }
        }
        update();
      },
      onError: (e) {
        Get.snackbar(
          'fail'.tr,
          'happen_error'.tr,
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        update();
      },
    );
  }
}
