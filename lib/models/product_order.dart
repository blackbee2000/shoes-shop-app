import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/type_product.dart';
part 'product_order.g.dart';

@JsonSerializable()
class ProductOrder {
  String? id;
  String? nameProductVi;
  String? nameProductEn;
  String? imageProduct;
  String? descriptionVi;
  String? descriptionEn;
  num? rating;
  TypeProduct? type;
  String? idCompany;
  int? price;
  String? productCode;

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
