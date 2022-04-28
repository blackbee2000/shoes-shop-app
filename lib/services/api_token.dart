import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiToken {
  static ApiToken get to => Get.put(ApiToken());
  final storage = GetStorage();

// Read token
  String? get appToken => storage.read('token');

  bool get isTokenExisted => appToken?.isNotEmpty == true;
}
