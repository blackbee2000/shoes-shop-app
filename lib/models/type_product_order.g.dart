part of 'type_product_order.dart';

TypeProductOrder _$TypeProductOrderFromJson(Map<String, dynamic> json) {
  return TypeProductOrder(
    json['size'] as String?,
  );
}

Map<String, dynamic> _$TypeProductOrderToJson(TypeProductOrder instance) =>
    <String, dynamic>{
      'size': instance.size,
    };
