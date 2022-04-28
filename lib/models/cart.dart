import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/product_order.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String? _id;
  ProductOrder? lstProduct;
  int? amount;
  int? totalPrice;
  String? idAccount;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Cart(
    this._id,
    this.lstProduct,
    this.amount,
    this.totalPrice,
    this.idAccount,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
