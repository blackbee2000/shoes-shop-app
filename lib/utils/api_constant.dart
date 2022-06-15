import 'package:shoes_shop_app/config/flavor_config.dart';

final String url = FlavorConfig.instance.values.baseUrl;

class ApiConstant {
  static final String LOGIN = '${url.toString()}/account/login';
  static final String REGISTER = '${url.toString()}/account/register';
  static final String CHANGEPASSWORD =
      '${url.toString()}/account/change_password';
  static final String RESETPASSWORD =
      '${url.toString()}/account/reset_password';
  static final String SENDOTP = '${url.toString()}/account/sendOtp';
  static final String SUBMITOTP = '${url.toString()}/account/submitOTP';
  static final String UPDATE = '${url.toString()}/account/update';
  static final String BLOG = '${url.toString()}/blog/all';
  static final String PRODUCT = '${url.toString()}/product/all';
  static final String PRODUCTBYCOMPANY =
      '${url.toString()}/product/GetProductByCompany';
  static final String NEWPRODUCT = '${url.toString()}/product/getNewProduct';
  static final String DISCOUNTPRODUCT =
      '${url.toString()}/product/getDiscountProduct';
  static final String TRENDINGPRODUCT =
      '${url.toString()}/product/getProductTrending';
  static final String PROFILE = '${url.toString()}/account/getAccount';
  static final String COMPANY = '${url.toString()}/company/all';
  static final String ADDRESS = '${url.toString()}/address/all';
  static final String ADDRESSDEFAULT =
      '${url.toString()}/address/getAddressDefault';
  static final String DELETEADDRESS = '${url.toString()}/address/delete?getId=';
  static final String CREATEADDRESS = '${url.toString()}/address/create';
  static final String UPDATEADDRESS = '${url.toString()}/address/update';
  static final String UPDATEDEFAULT =
      '${url.toString()}/address/updateStatusDefault?getId=';
  static final String ADDTOCART = '${url.toString()}/cart/create';
  static final String CART = '${url.toString()}/cart/all';
  static final String DELETECART = '${url.toString()}/cart/deleteMultiCart';
  static final String UPDATEAMOUNTCART =
      '${url.toString()}/cart/updateAmountCart';
  static final String PRODUCTRELATED =
      '${url.toString()}/product/getRelatedProducts';
  static final String SEARCHPRODUCT = '${url.toString()}/product/search';
  static final String LIKEPRODUCT = '${url.toString()}/account/submitFavorite';
  static final String PRODUCTFAVORITE =
      '${url.toString()}/account/getFavoriteAccount';
  static final String VOUCHER = '${url.toString()}/voucher/all';
  static final String ORDER = '${url.toString()}/order/create';
  static final String ORDERGETALL = '${url.toString()}/order/all';
  static final String ORDERBYSTATUS = '${url.toString()}/order/getOrderStatus';
  static final String ORDERUPDATESTATUS =
      '${url.toString()}/order/updateStatus';
  static final String CREATERATING = '${url.toString()}/rate/create';
  static final String GETRATEBYACCOUNT =
      '${url.toString()}/rate/getRateProductByAccount';
  static final String UPDATERATEBYACCOUNT =
      '${url.toString()}/rate/updateRateByAccount';
  static const String PROVINCE =
      'https://api.mysupership.vn/v1/partner/areas/province';
  static const String DISTRICT =
      'https://api.mysupership.vn/v1/partner/areas/district';
  static const String WARD =
      'https://api.mysupership.vn/v1/partner/areas/commune';
}
