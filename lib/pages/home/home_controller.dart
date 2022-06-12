import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/models/product_new.dart';
import 'package:shoes_shop_app/pages/address/address_controller.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';

class HomeController extends GetxController {
  final indexSelected = 0.obs;
  List<Company> listCompany = <Company>[].obs;
  List<ProductNew> listNewProduct = <ProductNew>[].obs;
  List<Product> listDiscountProduct = <Product>[].obs;
  List<Product> listTrendingProduct = <Product>[].obs;
  final addressController = Get.put(AddressController());

  @override
  void onInit() {
    super.onInit();
    getAllCompany();
    getNewProduct();
    getDiscountProduct();
    getTrendingProduct();
    addressController.getAddressDefault();
    addressController.update();
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

  getNewProduct() {
    HomeProvider().getNewProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listNewProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getDiscountProduct() {
    HomeProvider().getDiscountProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listDiscountProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }

  getTrendingProduct() {
    HomeProvider().getTrendingProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        listTrendingProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        update();
      },
    );
  }
}
