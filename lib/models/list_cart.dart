import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/product_order.dart';
part 'list_cart.g.dart';

@JsonSerializable()
class ListCart {
  ProductOrder? lstProduct;
  int? amount;
  int? totalPrice;
  String? id;

  ListCart(
    this.lstProduct,
    this.amount,
    this.totalPrice,
    this.id,
  );

  factory ListCart.fromJson(Map<String, dynamic> json) =>
      _$ListCartFromJson(json);

  Map<String, dynamic> toJson() => _$ListCartToJson(this);
}
