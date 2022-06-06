part of 'product_new_response.dart';

ProductNewResponse _$ProductNewResponseFromJson(Map<String, dynamic> json) {
  return ProductNewResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => ProductNew.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductNewResponseToJson(ProductNewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
