import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/order.dart';
part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  String? message;
  Order? data;

  OrderResponse(
    this.message,
    this.data,
  );

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
