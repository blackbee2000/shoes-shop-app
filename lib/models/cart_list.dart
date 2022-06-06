import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/cart.dart';
part 'cart_list.g.dart';

@JsonSerializable()
class CartList {
  String? message;
  List<Cart>? data;

  CartList(
    this.message,
    this.data,
  );

  factory CartList.fromJson(Map<String, dynamic> json) =>
      _$CartListFromJson(json);

  Map<String, dynamic> toJson() => _$CartListToJson(this);
}
