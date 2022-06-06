import 'package:get/get.dart';
import 'package:shoes_shop_app/models/paymethod.dart';

class PaymentController extends GetxController {
  final indexSelected = 0.obs;
  final listPayMethod = <PayMethod>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() {
    listPayMethod.add(PayMethod(name: 'Pay via VNpay'));
    listPayMethod.add(PayMethod(name: 'Pay via Paypal'));
    listPayMethod.add(PayMethod(name: 'Pay via COD'));
    update();
  }
}
