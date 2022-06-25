part of 'shipping.dart';

Shipping _$ShippingFromJson(Map<String, dynamic> json) {
  return Shipping(
    json['fee'] as int?,
  );
}

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'fee': instance.fee,
    };
