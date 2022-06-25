part of 'shipping_response.dart';

ShippingRes _$ShippingResFromJson(Map<String, dynamic> json) {
  return ShippingRes(
    json['success'] as bool?,
    json['fee'] == null
        ? null
        : Shipping.fromJson(json['fee'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShippingResToJson(ShippingRes instance) =>
    <String, dynamic>{
      'success': instance.success,
      'fee': instance.fee,
    };
