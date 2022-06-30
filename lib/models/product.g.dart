part of 'product.dart';

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['_id'] as String?,
    json['nameProductVi'] as String?,
    json['nameProductEn'] as String?,
    json['imageProduct'] as String?,
    json['descriptionVi'] as String?,
    json['descriptionEn'] as String?,
    json['rating'] as num?,
    json['quantitySold'] as int?,
    json['discount'] as int?,
    (json['type'] as List<dynamic>?)
        ?.map((e) => TypeProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['listImageDetail'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    json['style'] as String?,
    json['idCompany'] as String?,
    json['price'] as int?,
    json['productCode'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
    json['isLike'] as bool?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'nameProductVi': instance.nameProductVi,
      'nameProductEn': instance.nameProductEn,
      'imageProduct': instance.imageProduct,
      'descriptionVi': instance.descriptionVi,
      'descriptionEn': instance.descriptionEn,
      'rating': instance.rating,
      'quantitySold': instance.quantitySold,
      'discount': instance.discount,
      'type': instance.type,
      'listImageDetail': instance.listImageDetail,
      'style': instance.style,
      'idCompany': instance.idCompany,
      'price': instance.price,
      'productCode': instance.productCode,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
      'isLike': instance.isLike,
    };
