import 'package:shoes_shop_app/config/flavor_config.dart';

final String url = FlavorConfig.instance.values.baseUrl;

class ApiConstant {
  static final String LOGIN = '${url.toString()}/account/login';
  static final String REGISTER = '${url.toString()}/account/register';
  static final String UPDATE = '${url.toString()}/account/update';
  static final String BLOG = '${url.toString()}/blog/all';
  static final String PRODUCT = '${url.toString()}/product/all';
  static final String PROFILE = '${url.toString()}/account/getAccount';
  static final String COMPANY = '${url.toString()}/company/all';
}
