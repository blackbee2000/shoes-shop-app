import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/cart.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  String? message;
  Cart? data;

  CartResponse(
    this.message,
    this.data,
  );

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
