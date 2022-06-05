import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/models/type_product_order.dart';
part 'product_new.g.dart';

@JsonSerializable()
class ProductNew {
  Product? product;
  String? companyName;

  ProductNew(
    this.product,
    this.companyName,
  );

  factory ProductNew.fromJson(Map<String, dynamic> json) =>
      _$ProductNewFromJson(json);

  Map<String, dynamic> toJson() => _$ProductNewToJson(this);
}
