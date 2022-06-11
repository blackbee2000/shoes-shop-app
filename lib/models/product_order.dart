import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/type_product_order.dart';
part 'product_order.g.dart';

@JsonSerializable()
class ProductOrder {
  dynamic id;
  dynamic nameProductVi;
  dynamic nameProductEn;
  dynamic imageProduct;
  dynamic descriptionVi;
  dynamic descriptionEn;
  dynamic rating;
  dynamic type;
  dynamic idCompany;
  dynamic price;
  dynamic productCode;

  ProductOrder(
    this.id,
    this.nameProductVi,
    this.nameProductEn,
    this.imageProduct,
    this.descriptionVi,
    this.descriptionEn,
    this.rating,
    this.type,
    this.idCompany,
    this.price,
    this.productCode,
  );

  factory ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderToJson(this);
}
