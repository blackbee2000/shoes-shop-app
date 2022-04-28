part of 'product_response.dart';

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Product.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
