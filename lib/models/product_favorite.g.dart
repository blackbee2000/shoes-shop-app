part of 'product_favorite.dart';

ProductFavorite _$ProductFavoriteFromJson(Map<String, dynamic> json) {
  return ProductFavorite(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductFavoriteToJson(ProductFavorite instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
