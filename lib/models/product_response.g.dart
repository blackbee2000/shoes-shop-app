part of 'product_response.dart';

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['totalProdcut'] as int?,
  );
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'totalProdcut': instance.totalProdcut,
    };
