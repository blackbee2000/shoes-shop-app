import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/product/product_controller.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class ProductFavoriteController extends GetxController {
  List<String> listProductFavorite = <String>[].obs;
  List<Product> listProductAll = <Product>[].obs;
  List<Product> listProductFavoriteFinal = <Product>[].obs;
  final productController = Get.put(ProductController());
  @override
  void onInit() async {
    super.onInit();
    getAllProduct();
  }

  getAllProduct() {
    ProfileProvider().getAllProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        if (res.data!.isNotEmpty) {
          listProductAll = res.data!;
          for (var e in listProductAll) {
            e.isLike = false;
          }
          getListProductFavorite(listProductAll);
        } else {
          listProductAll = [];
        }
        print(
            'GET ALLL PRODUCT IN PROFILE SUCESSS ===> ${listProductAll.toString()}');
        update();
      },
      onError: (e) {
        print('GET ALLL PRODUCT IN PROFILE FAIL ===> ${e.toString()}');
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
        for (var e in productList) {
          for (var x in listProductFavorite) {
            if (e.id == x) {
              e.isLike = true;
              listProductFavoriteFinal.add(e);
            }
          }
        }
        print(
            'GET ALLL PRODUCT SUCESS ===> ${listProductFavoriteFinal.toString()}');
        update();
      },
      onError: (e) {
        print('GET ALLL PRODUCT FAVORITE ===> ${e.toString()}');
        update();
      },
    );
  }

  likeProduct(String id) {
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
        Get.snackbar(
          'Success',
          'Đã hủy thích sản phẩm',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );

        for (var e in listProductFavoriteFinal) {
          if (id == e.id) {
            e.isLike = !e.isLike!;
            listProductFavoriteFinal.remove(e);
          }
        }
        productController.update();
        update();
      },
      onError: (e) {
        print('ĐÃ XẢY RA LỖI =====> ${e}');
        update();
      },
    );
  }
}
