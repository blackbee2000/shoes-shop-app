import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/address_order.dart';
import 'package:shoes_shop_app/models/list_cart.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  List<ListCart>? lstCart;
  String? idAccount;
  int? status;
  int? totalPrice;
  bool? statusPayment;
  List<AddressOrder>? address;
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
