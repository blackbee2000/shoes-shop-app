import 'package:json_annotation/json_annotation.dart';
part 'product_favorite.g.dart';

@JsonSerializable()
class ProductFavorite {
  String? message;
  List<String>? data;

  ProductFavorite(
    this.message,
    this.data,
  );

  factory ProductFavorite.fromJson(Map<String, dynamic> json) =>
      _$ProductFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFavoriteToJson(this);
}
