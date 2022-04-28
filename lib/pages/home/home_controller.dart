import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/pages/home/home_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class HomeController extends GetxController {
  final indexSelected = 0.obs;
  List<Company> listCompany = <Company>[].obs;

  @override
  void onInit() async {
    print('TOKEN ${ApiToken.to.appToken}');
    super.onInit();
    getAllCompany();
  }

  getAllCompany() {
    HomeProvider().getAllCompany(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        print('GET ALL COMPANY SUCCESS =>>>>>>> ${res.toString()}');
        listCompany = res.data ?? [];
      },
      onError: (e) {
        print('GET ALL COMPANY FAIL =>>>>>>> ${e.toString()}');
      },
    );
  }
}
