import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/pages/product/product_provider.dart';
import 'package:shoes_shop_app/pages/profile/profile_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductController extends GetxController {
  List<String> listProductFavorite = <String>[].obs;
  List<Product> listProduct = <Product>[].obs;
  List<Company> listCompany = <Company>[].obs;
  final nameBrand = ''.obs;
  final skip = 1.obs;
  final limit = 8;
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      getAllCompany(pageKey);
    });
  }

  getAllCompany(int pageKey) {
    HomeProvider().getAllCompany(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listCompany = res.data ?? [];
        nameBrand.value = listCompany.first.nameCompany ?? '';
        if (ApiToken.to.isTokenExisted == true) {
          getListProductFavorite(listCompany.first.id ?? '', pageKey);
        } else {
          getAllProduct(listCompany.first.id ?? '', [], pageKey);
        }

        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getAllProduct(
      String idCompany, List<String> productFavoriteList, int pageKey) {
    ProductProvider().getAllProduct(
      params: {"idCompany": idCompany, "skip": skip, "limit": limit},
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProduct = res.data ?? [];
        print('GET PRODUCT SUCCESS =>>>> ${res.data.toString()}');
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

        skip.value = skip.value + 1;
        try {
          final isLastPage = listProduct.length < limit;
          if (isLastPage) {
            pagingController.appendLastPage(listProduct);
          } else {
            final nextPageKey = pageKey + listProduct.length;
            pagingController.appendPage(listProduct, nextPageKey);
          }
        } catch (error) {
          pagingController.error = error;
        }

        update();
      },
      onError: (e) {
        print('GET PRODUCT FAIL =>>>> ${e.toString()}');
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
            'success'.tr,
            'product_liked'.tr,
            colorText: Colors.white,
            backgroundColor: const Color(0xff00FF00),
          );
        } else {
          Get.snackbar(
            'success'.tr,
            'product_canceled_like'.tr,
            colorText: Colors.white,
            backgroundColor: const Color(0xff00FF00),
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
          'fail'.tr,
          'happen_error'.tr,
          colorText: Colors.white,
          backgroundColor: const Color(0xffFF0000),
        );
        update();
      },
    );
  }

  getListProductFavorite(String idCompany, int pageKey) {
    ProfileProvider().getListProductFavorite(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listProductFavorite = res.data ?? [];
        getAllProduct(idCompany, listProductFavorite, pageKey);
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
