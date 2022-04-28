part of 'cart.dart';

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    json['_id'] as String?,
    json['lstProduct'] == null
        ? null
        : ProductOrder.fromJson(json['lstProduct'] as Map<String, dynamic>),
    json['amount'] as int?,
    json['totalPrice'] as int?,
    json['idAccount'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      '_id': instance._id,
      'lstProduct': instance.lstProduct,
      'amount': instance.amount,
      'totalPrice': instance.totalPrice,
      'idAccount': instance.idAccount,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
