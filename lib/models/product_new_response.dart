import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/company.dart';
import 'package:shoes_shop_app/models/product_new.dart';
part 'product_new_response.g.dart';

@JsonSerializable()
class ProductNewResponse {
  String? message;
  List<ProductNew>? data;

  ProductNewResponse(
    this.message,
    this.data,
  );

  factory ProductNewResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductNewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductNewResponseToJson(this);
}
