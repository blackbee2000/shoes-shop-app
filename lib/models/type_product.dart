import 'package:json_annotation/json_annotation.dart';
part 'type_product.g.dart';

@JsonSerializable()
class TypeProduct {
  String? id;
  String? size;
  int? quantity;
  String? color;

  TypeProduct(
    this.id,
    this.size,
    this.quantity,
    this.color,
  );

  factory TypeProduct.fromJson(Map<String, dynamic> json) =>
      _$TypeProductFromJson(json);

  Map<String, dynamic> toJson() => _$TypeProductToJson(this);
}
