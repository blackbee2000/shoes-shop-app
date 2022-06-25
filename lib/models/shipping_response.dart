import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/profile.dart';
import 'package:shoes_shop_app/models/shipping.dart';
part 'shipping_response.g.dart';

@JsonSerializable()
class ShippingRes {
  bool? success;
  Shipping? fee;

  ShippingRes(
    this.success,
    this.fee,
  );

  factory ShippingRes.fromJson(Map<String, dynamic> json) =>
      _$ShippingResFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingResToJson(this);
}
