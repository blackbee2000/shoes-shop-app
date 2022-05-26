part of 'type_product.dart';

TypeProduct _$TypeProductFromJson(Map<String, dynamic> json) {
  return TypeProduct(
    json['id'] as String?,
    json['size'] as String?,
    json['quantity'] as int?,
    json['color'] as String?,
  );
}

Map<String, dynamic> _$TypeProductToJson(TypeProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'quantity': instance.quantity,
      'color': instance.color,
    };
