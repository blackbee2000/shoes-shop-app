part of 'product_order.dart';

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return ProductOrder(
    json['_id'] as String?,
    json['nameProductVi'] as String?,
    json['nameProductEn'] as String?,
    json['imageProduct'] as String?,
    json['descriptionVi'] as String?,
    json['descriptionEn'] as String?,
    json['rating'] as num?,
    json['type'] == null
        ? null
        : TypeProductOrder.fromJson(json['type'] as Map<String, dynamic>),
    json['idCompany'] as String?,
    json['price'] as int?,
    json['productCode'] as String?,
  );
}

Map<String, dynamic> _$ProductOrderToJson(ProductOrder instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameProductVi': instance.nameProductVi,
      'nameProductEn': instance.nameProductEn,
      'imageProduct': instance.imageProduct,
      'descriptionVi': instance.descriptionVi,
      'descriptionEn': instance.descriptionEn,
      'rating': instance.rating,
      'type': instance.type,
      'idCompany': instance.idCompany,
      'price': instance.price,
      'productCode': instance.productCode,
    };
