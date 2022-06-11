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
        print('GET ALL COMPANY SUCCESS =>>>>>>> ${res.toString()}');
        listCompany = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET ALL COMPANY FAIL =>>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getNewProduct() {
    HomeProvider().getNewProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET NEW PRODUCT SUCCESS =>>>>>>> ${res.toString()}');
        listNewProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET NEW PRODUCT FAIL =>>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getDiscountProduct() {
    HomeProvider().getDiscountProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET DISCOUNT PRODUCT SUCCESS =>>>>>>> ${res.toString()}');
        listDiscountProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET DISCOUNT PRODUCT FAIL =>>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getTrendingProduct() {
    HomeProvider().getTrendingProduct(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET TRENDING PRODUCT SUCCESS =>>>>>>> ${res.toString()}');
        listTrendingProduct = res.data ?? [];
        update();
      },
      onError: (e) {
        print('GET TRENDING PRODUCT FAIL =>>>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
