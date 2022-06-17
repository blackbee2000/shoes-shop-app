import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/cart.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  List<Cart>? lstCart;
  String? idAccount;
  int? status;
  int? totalDiscount;
  int? totalShipping;
  int? totalPriceProduct;
  int? totalPrice;
  bool? statusPayment;
  Address? address;
  String? voucher;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Order(
    this.id,
    this.lstCart,
    this.idAccount,
    this.status,
    this.totalDiscount,
    this.totalShipping,
    this.totalPriceProduct,
    this.totalPrice,
    this.statusPayment,
    this.address,
    this.voucher,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
