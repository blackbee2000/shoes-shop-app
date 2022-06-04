import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/cart.dart';
import 'package:shoes_shop_app/pages/cart/cart_provider.dart';
import 'package:shoes_shop_app/pages/payment/payment_page.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class CartController extends GetxController {
  final indexSelected = 0.obs;
  List<Cart> listCart = <Cart>[].obs;
  List<Cart> listCartSelected = <Cart>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getAllCart();
  }

  getAllCart() {
    CartProvider().getAllCart(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listCart = res.data ?? [];
        for (var e in listCart) {
          e.isChecked = false;
        }
        print('GET DATA ALL CART SUCESSS =>>>>>> ${listCart.first.isChecked}');
        update();
      },
      onError: (e) {
        print('GET DATA ALL CART =>>>>>> ${e.toString()}');
        update();
      },
    );
  }

  getListCartSelected(idWidget) {
    for (var e in listCart) {
      if (e.isChecked == true) {
        listCartSelected.add(e);
      }
    }
    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      Get.to(PaymentPage(id: idWidget), id: idWidget);
    });
  }
}
