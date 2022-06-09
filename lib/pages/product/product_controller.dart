import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class ProductController extends GetxController {
  List<String> listProductFavorite = <String>[].obs;
  List<Product> listProduct = <Product>[].obs;
  List<Company> listCompany = <Company>[].obs;
  final nameBrand = ''.obs;
  @override
  void onInit() {
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
        if (ApiToken.to.isTokenExisted == true) {
          getListProductFavorite(listCompany.first.id ?? '');
        } else {
          getAllProduct(listCompany.first.id ?? '', []);
        }
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

  getAllProduct(String idCompany, List<String> productFavoriteList) {
    ProductProvider().getAllProduct(
      params: {"idCompany": idCompany, "skip": 1, "limit": 10},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProduct = res.data ?? [];
        for (var e in listProduct) {
          e.isLike = false;
        }
        if (productFavoriteList.isNotEmpty) {
          for (var x in listProduct) {
            for (var k in productFavoriteList) {
              if (k == x.id) {
                x.isLike = true;
              }
            }
          }
        }
        print(
            'GET PRODUCT SUCESSSSSSSSSSSSSS ==>>>>>>> ${listProduct.toString()}');
        update();
      },
      onError: (e) {
        print('GET PRODUCT FAIL ==>>>>>>> ${e.toString()}');
        update();
      },
    );
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
            'Success',
            'Đã thích sản phẩm',
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

        for (var e in listProduct) {
          if (id == e.id) {
            e.isLike = !e.isLike!;
          }
        }
        update();
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Đã xảy ra lỗi',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        print('ĐÃ XẢY RA LỖI PRODUCT =====> ${e}');
        update();
      },
    );
  }

  getListProductFavorite(String idCompany) {
    ProfileProvider().getListProductFavorite(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProductFavorite = res.data ?? [];
        getAllProduct(idCompany, listProductFavorite);
        update();
      },
      onError: (e) {
        print('GET ALLL PRODUCT FAVORITE ===> ${e.toString()}');
        update();
      },
    );
  }
}
