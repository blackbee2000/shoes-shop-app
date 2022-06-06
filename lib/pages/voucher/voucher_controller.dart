import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/voucher.dart';
import 'package:shoes_shop_app/pages/voucher/voucher_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class VoucherController extends GetxController {
  List<Voucher> listVoucher = <Voucher>[].obs;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getAllVoucher();
  }

  getAllVoucher() {
    VoucherProvider().getAllVoucher(
      option: Options(
        headers: {
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {},
      onSuccess: (res) {
        listVoucher = res.data ?? [];
        print('LIST VOUCHER =>>>>> ${listVoucher.toString()}');
        update();
      },
      onError: (e) {
        print('GET ALL VOUCHER FAIL =>>>>> ${e.toString()}');
        update();
      },
    );
  }
}
