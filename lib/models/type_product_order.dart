import 'package:json_annotation/json_annotation.dart';
part 'type_product_order.g.dart';

@JsonSerializable()
class TypeProductOrder {
  String? size;
  int? quantity;

  TypeProductOrder(
    this.size,
    this.quantity,
  );

  factory TypeProductOrder.fromJson(Map<String, dynamic> json) =>
      _$TypeProductOrderFromJson(json);

  Map<String, dynamic> toJson() => _$TypeProductOrderToJson(this);
}
