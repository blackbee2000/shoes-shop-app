part of 'product_new.dart';

ProductNew _$ProductNewFromJson(Map<String, dynamic> json) {
  return ProductNew(
    json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    json['companyName'] as String?,
  );
}

Map<String, dynamic> _$ProductNewToJson(ProductNew instance) =>
    <String, dynamic>{
      'product': instance.product,
      'companyName': instance.companyName,
    };
