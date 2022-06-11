part of 'bill.dart';

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill(
    json['typePayment'] as String?,
    json['_id'] as String?,
    // (json['lstCart'] as List<dynamic>?)
    //     ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
    //     .toList(),
    json['idAccount'] as String?,
    json['status'] as int?,
    json['totalDiscount'] as int?,
    json['totalShipping'] as int?,
    json['totalPriceProduct'] as int?,
    json['totalPrice'] as int?,
    json['statusPayment'] as bool?,
    // json['address'] == null
    //     ? null
    //     : Address.fromJson(json['address'] as Map<String, dynamic>),
    json['voucher'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
  );
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'typePayment': instance.typePayment,
      '_id': instance.id,
      // 'lstCart': instance.lstCart,
      'idAccount': instance.idAccount,
      'status': instance.status,
      'totalDiscount': instance.totalDiscount,
      'totalShipping': instance.totalShipping,
      'totalPriceProduct': instance.totalPriceProduct,
      'totalPrice': instance.totalPrice,
      'statusPayment': instance.statusPayment,
      // 'address': instance.address,
      'voucher': instance.voucher,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
