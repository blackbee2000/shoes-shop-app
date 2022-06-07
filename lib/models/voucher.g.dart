part of 'voucher.dart';

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return Voucher(
    json['_id'] as String?,
    json['title'] as String?,
    json['voucherCode'] as String?,
    json['discount'] as int?,
    json['maxDiscount'] as int?,
    json['expiry'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
    json['quantity'] as String?,
  );
}

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'voucherCode': instance.voucherCode,
      'discount': instance.discount,
      'maxDiscount': instance.maxDiscount,
      'expiry': instance.expiry,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
      'quantity': instance.quantity,
    };