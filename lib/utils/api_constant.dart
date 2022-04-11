import 'package:shoes_shop_app/config/flavor_config.dart';

final String url = FlavorConfig.instance.values.baseUrl;

class ApiConstant {
  static final String LOGIN = '${url}/account/login';
}
