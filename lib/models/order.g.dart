part of 'order.dart';

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['_id'] as String?,
    (json['lstCart'] as List<dynamic>?)
        ?.map((e) => ListCart.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['idAccount'] as String?,
    json['status'] as int?,
    json['totalPrice'] as int?,
    json['statusPayment'] as bool?,
    (json['address'] as List<dynamic>?)
        ?.map((e) => AddressOrder.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance._id,
      'lstCart': instance.lstCart,
      'idAccount': instance.idAccount,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'statusPayment': instance.statusPayment,
      'address': instance.address,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
