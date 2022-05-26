import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/type_product.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String? _id;
  String? nameProductVi;
  String? nameProductEn;
  List<String>? imageProduct;
  String? descriptionVi;
  String? descriptionEn;
  dynamic rating;
  int? quantitySold;
  int? discount;
  List<TypeProduct>? type;
  String? idCompany;
  int? price;
  String? productCode;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Product(
    this._id,
    this.nameProductVi,
    this.nameProductEn,
    this.imageProduct,
    this.descriptionVi,
    this.descriptionEn,
    this.rating,
    this.quantitySold,
    this.discount,
    this.type,
    this.idCompany,
    this.price,
    this.productCode,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
