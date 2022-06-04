import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/product_order.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String? id;
  ProductOrder? lstProduct;
  int? amount;
  int? totalPrice;
  String? idAccount;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;
  bool? isChecked;

  Cart(
    this.id,
    this.lstProduct,
    this.amount,
    this.totalPrice,
    this.idAccount,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
    this.isChecked,
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
