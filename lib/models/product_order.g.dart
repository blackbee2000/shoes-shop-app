part of 'product_order.dart';

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return ProductOrder(
    json['_id'] as dynamic,
    json['nameProductVi'] as dynamic,
    json['nameProductEn'] as dynamic,
    json['imageProduct'] as dynamic,
    json['descriptionVi'] as dynamic,
    json['descriptionEn'] as dynamic,
    json['rating'] as dynamic,
    json['type'] as dynamic,
    json['idCompany'] as dynamic,
    json['price'] as dynamic,
    json['productCode'] as dynamic,
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
