import 'package:json_annotation/json_annotation.dart';
part 'shipping.g.dart';

@JsonSerializable()
class Shipping {
  int? fee;

  Shipping(
    this.fee,
  );

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}
