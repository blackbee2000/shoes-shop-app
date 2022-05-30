import 'package:shoes_shop_app/config/flavor_config.dart';

final String url = FlavorConfig.instance.values.baseUrl;

class ApiConstant {
  static final String LOGIN = '${url.toString()}/account/login';
  static final String REGISTER = '${url.toString()}/account/register';
  static final String CHANGEPASSWORD = '${url.toString()}/user/change_password';
  static final String UPDATE = '${url.toString()}/account/update';
  static final String BLOG = '${url.toString()}/blog/all';
  static final String PRODUCT = '${url.toString()}/product/all';
  static final String NEWPRODUCT = '${url.toString()}/product/getNewProduct';
  static final String DISCOUNTPRODUCT =
      '${url.toString()}/product/getDiscountProduct';
  static final String TRENDINGPRODUCT =
      '${url.toString()}/product/getProductTrending';
  static final String PROFILE = '${url.toString()}/account/getAccount';
  static final String COMPANY = '${url.toString()}/company/all';
  static final String ADDRESS = '${url.toString()}/address/all';
}
