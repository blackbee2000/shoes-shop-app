import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/product.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  String? message;
  List<Product>? data;

  ProductResponse(
    this.message,
    this.data,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
