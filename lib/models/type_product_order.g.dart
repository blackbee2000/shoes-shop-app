part of 'type_product_order.dart';

TypeProductOrder _$TypeProductOrderFromJson(Map<String, dynamic> json) {
  return TypeProductOrder(
    json['size'] as String?,
    json['quantity'] as int?,
  );
}

Map<String, dynamic> _$TypeProductOrderToJson(TypeProductOrder instance) =>
    <String, dynamic>{
      'size': instance.size,
      'quantity': instance.quantity,
    };
